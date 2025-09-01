from setuptools import setup, find_packages

if __name__ == "__main__":
    setup(
        packages=find_packages(include=["hello_sonic_pkg", "hello_sonic_pkg.*"])
    )
