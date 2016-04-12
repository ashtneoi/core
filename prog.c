#include "common.h"

#include <stdlib.h>

#include "fail.h"


int main()
{
    warning("About to exit");
    fatal(E_COMMON, "Program not implemented");
}
