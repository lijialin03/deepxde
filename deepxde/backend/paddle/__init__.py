from .tensor import *  # pylint: disable=redefined-builtin
import os

# enable prim if specified
enable_prim_value = os.getenv("PRIM")
enable_prim = enable_prim_value.lower() in ['1', 'true', 'yes', 'on'] if enable_prim_value else False
if enable_prim:
    # Mostly for compiler running with dy2st.
    from paddle.framework import core

    core.set_prim_eager_enabled(True)
    core._set_prim_all_enabled(True)
    print("Prim mode is enabled.")