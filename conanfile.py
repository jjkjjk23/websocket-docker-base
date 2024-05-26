from conan import ConanFile
from conan.tools.cmake import cmake_layout


class ExampleRecipe(ConanFile):
    settings = "os", "compiler", "build_type", "arch"
    generators = "CMakeDeps", "CMakeToolchain"

    def build(self):
        self.env["tools.build.compiler_executables"] = {
            "cpp": "/usr/bin/clang++",
        }

    def requirements(self):
        self.requires("openssl/3.2.1")
        self.requires("websocketpp/0.8.2")
        self.requires("libpq/15.5")
        self.requires("libcurl/8.6.0")

    def build_requirements(self):
        self.tool_requires("ninja/1.12.1")

    def layout(self):
        cmake_layout(self)

