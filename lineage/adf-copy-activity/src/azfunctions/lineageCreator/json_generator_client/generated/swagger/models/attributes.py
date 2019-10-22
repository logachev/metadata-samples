# coding=utf-8
# --------------------------------------------------------------------------
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.
# --------------------------------------------------------------------------

from msrest.serialization import Model


class Attributes(Model):
    """Attributes.

    :param inputs:
    :type inputs: list[~swagger.models.AttributesInputs]
    :param outputs:
    :type outputs: list[~swagger.models.AttributesOutputs]
    :param qualified_name:
    :type qualified_name: str
    :param name:
    :type name: str
    :param start_time:
    :type start_time: str
    :param end_time:
    :type end_time: str
    """

    _attribute_map = {
        'inputs': {'key': 'inputs', 'type': '[AttributesInputs]'},
        'outputs': {'key': 'outputs', 'type': '[AttributesOutputs]'},
        'qualified_name': {'key': 'qualifiedName', 'type': 'str'},
        'name': {'key': 'name', 'type': 'str'},
        'start_time': {'key': 'StartTime', 'type': 'str'},
        'end_time': {'key': 'EndTime', 'type': 'str'},
    }

    def __init__(self, **kwargs):
        super(Attributes, self).__init__(**kwargs)
        self.inputs = kwargs.get('inputs', None)
        self.outputs = kwargs.get('outputs', None)
        self.qualified_name = kwargs.get('qualified_name', None)
        self.name = kwargs.get('name', None)
        self.start_time = kwargs.get('start_time', None)
        self.end_time = kwargs.get('end_time', None)
