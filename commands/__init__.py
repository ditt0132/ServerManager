from .server_manager import CreateServerCommand, DeleteServerCommand
from .map_manager import ApplyMapCommand, ResetMapCommand

# from .properties_manager import MapTypeCommand, EnableCommandBlockCommand
# from .op_manager import OPCommand, DeOPCommand
# from .run_manager import RunServerCommand

COMMANDS = [
    CreateServerCommand,
    DeleteServerCommand,
    ApplyMapCommand,
    ResetMapCommand,
    # MapTypeCommand,
    # EnableCommandBlockCommand,
    # OPCommand,
    # DeOPCommand,
    # RunServerCommand
]


def get_command(name):
    for clazz in COMMANDS:
        command = clazz()
        if name == command.name:
            return command
        elif name in command.alias:
            return command
