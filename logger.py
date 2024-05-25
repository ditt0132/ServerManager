def error(*args, sep=' '):
    print(f"\033[91m{sep.join(map(str, args))}\033[0m")


def warn(*args, sep=' '):
    print(f"\033[93m{sep.join(map(str, args))}\033[0m")


def info(*args, sep=' '):
    print(f"{sep.join(map(str, args))}\033[0m")


def fatal(*args, sep=' '):
    print(f"\033[41m\033[30m{sep.join(map(str, args))}\033[0m")


def test():
    error("Error!", "File not found")
    warn("Warning!", "No command found")
    info("Info!", "Creating directory")
    fatal("FATAL!!", "ERROR!")


# test()
