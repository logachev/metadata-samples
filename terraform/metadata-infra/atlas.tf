resource "azurerm_container_group" "this" {
  name                  = "${var.atlas_dns_name}"
  resource_group_name   = "${azurerm_resource_group.this.name}"
  location              = "${azurerm_resource_group.this.location}"
  ip_address_type       = "public"
  dns_name_label        = "${var.atlas_dns_name}"
  os_type               = "linux"

    container {
      name      = "kafka"
      image     = "wurstmeister/kafka"
      cpu       = "1"
      memory    = "2"
      ports {
        port = 9092
      }
      environment_variables = {
        KAFKA_CREATE_TOPICS = "create_events:1:1,delete_events:1:1,ATLAS_HOOK:1:1"
        KAFKA_ADVERTISED_HOST_NAME = "${var.atlas_dns_name}.${azurerm_resource_group.this.location}.azurecontainer.io"
        KAFKA_ADVERTISED_PORT = 9092
        KAFKA_ZOOKEEPER_CONNECT = "${var.atlas_dns_name}.${azurerm_resource_group.this.location}.azurecontainer.io:2181"
      }
    }

    container {
      name      = "atlas"
      image     = "stefanmsft/metadata-samples-atlas"
      cpu       = "3"
      memory    = "8"
      ports {
        port = 21000
      }
      ports {
        port = 2181
      }
    }
}

# Upload Atlas connection data to the KeyVault
resource "azurerm_key_vault_secret" "atlas_username" {
  name         = "AtlasUsername"
  value        = "admin"
  key_vault_id = "${data.azurerm_key_vault.base.id}"
}

resource "azurerm_key_vault_secret" "atlas_password" {
  name         = "AtlasPassword"
  value        = "admin"
  key_vault_id = "${data.azurerm_key_vault.base.id}"
}

resource "azurerm_key_vault_secret" "atlas_server_ip" {
  name         = "AtlasServerIp"
  value        = "${azurerm_container_group.this.ip_address}"
  key_vault_id = "${data.azurerm_key_vault.base.id}"
}

resource "azurerm_key_vault_secret" "atlas_server_port" {
  name         = "AtlasServerPort"
  value        = "21000"
  key_vault_id = "${data.azurerm_key_vault.base.id}"
}
