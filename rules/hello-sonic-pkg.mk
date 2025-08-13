# Python wheel package (no global inclusion here)
HELLO_PY3 = hello_sonic_pkg-0.1.0-py3-none-any.whl
$(HELLO_PY3)_SRC_PATH       = $(SRC_PATH)/hello-sonic-pkg
$(HELLO_PY3)_PYTHON_VERSION = 3
$(HELLO_PY3)_TEST           = n

SONIC_PYTHON_WHEELS += $(HELLO_PY3)