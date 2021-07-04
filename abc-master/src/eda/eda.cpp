/**CFile****************************************************************

  FileName    [eda.c]

  SystemName  [ABC: Logic synthesis and verification system.]

  PackageName [Problem A solver]

  Synopsis    [Command file.]

  Author      [tim701-study, ezpz00, plwu1024]

  Affiliation [NTU]

  Date        [Ver. 1.0. Started - June 24, 2021.]

***********************************************************************/

#include "eda.h"
#include "base/main/main.h"
#include "base/main/mainInt.h"

#include "eda/findtarget.cpp"
#include "eda/hello.cpp"

#include <iostream>

int Eda_CommandHello(Abc_Frame_t *pAbc, int argc, char **argv)
{
    int fVerbose, c;
    fVerbose = 0;
    Extra_UtilGetoptReset();
    while ((c = Extra_UtilGetopt(argc, argv, "vh")) != EOF)
    {
        switch (c)
        {
        case 'v':
            fVerbose ^= 1;
            break;
        case 'h':
            goto usage;
        default:
            goto usage;
        }
    }
    Eda_Hello(fVerbose);
    return 0;

usage:
    Abc_Print(-2, "usage: hello [-vh]\n");
    Abc_Print(-2, "\t         say hello!\n");
    Abc_Print(-2, "\t-v     : toggle printing verbose information [default = %s]\n", fVerbose ? "yes" : "no");
    Abc_Print(-2, "\t-h     : print the command usage\n");
    return 1;
}

int Eda_CommandRunFindTarget(Abc_Frame_t *pAbc, int argc, char **argv)
{
    char *pFileNames[5] = {NULL};
    int c, nTimeout = 0, fCheck = 0, fRandom = 0, fInputs = 0, fVerbose = 0, fVeryVerbose = 0;
    Extra_UtilGetoptReset();
    while ((c = Extra_UtilGetopt(argc, argv, "Tcrivwh")) != EOF)
    {
        switch (c)
        {
        case 'T':
            if (globalUtilOptind >= argc)
            {
                Abc_Print(-1, "Command line switch \"-T\" should be followed by an integer.\n");
                goto usage;
            }
            nTimeout = atoi(argv[globalUtilOptind]);
            globalUtilOptind++;
            if (nTimeout < 0)
                goto usage;
            break;
        case 'c':
            fCheck ^= 1;
            break;
        case 'r':
            fRandom ^= 1;
            break;
        case 'i':
            fInputs ^= 1;
            break;
        case 'v':
            fVerbose ^= 1;
            break;
        case 'w':
            fVeryVerbose ^= 1;
            break;
        case 'h':
            goto usage;
        default:
            goto usage;
        }
    }
    //    pArgvNew = argv + globalUtilOptind;
    //    nArgcNew = argc - globalUtilOptind;
    if (argc - globalUtilOptind < 3 || argc - globalUtilOptind > 4)
    {
        Abc_Print(1, "Expecting 3~4 file names on the command line.\n");
        goto usage;
    }
    for (c = 0; c < 2; c++)
    {
        FILE *pFile = fopen(argv[globalUtilOptind + c], "rb");
        if (pFile == NULL)
        {
            return 0;
        }
        else
        {
            // printf("Can open input file \"%s\".\n", argv[globalUtilOptind + c]);
            fclose(pFile);
        }
        pFileNames[c] = argv[globalUtilOptind + c];
    }
    pFileNames[2] = argv[globalUtilOptind + 2];
    for (c = 3; c < argc - globalUtilOptind; c++)
    {
        FILE *pFile = fopen(argv[globalUtilOptind + c], "rb");
        if (pFile == NULL)
        {
            printf("Cannot open input file \"%s\".\n", argv[globalUtilOptind + c]);
            return 0;
        }
        else
        {
            fclose(pFile);
        }
        pFileNames[c] = argv[globalUtilOptind + c];
    }

    Eda_NtkRunFindTarget(pFileNames, nTimeout, fCheck, fRandom, fInputs, fVerbose, fVeryVerbose);
    return 0;

usage:
    Abc_Print(-2, "usage: runfindtarget [-T num] [-crivwh] <implementation> <specification> <imple_ta> <weights>\n");
    Abc_Print(-2, "\t         try to find target and solve the eco problem. for example:\n");
    Abc_Print(-2, "\t         \"runfindtarget unit1/F.v unit1/G.v unit1/F_t.v unit/G_t.v unit1/weight.txt; cec -n out.v unit1/G.v\")\n");
    Abc_Print(-2, "\t-T num : the timeout in seconds [default = %d]\n", nTimeout);
    Abc_Print(-2, "\t-c     : toggle checking that the problem has a solution [default = %s]\n", fCheck ? "yes" : "no");
    Abc_Print(-2, "\t-r     : toggle using random permutation of support variables [default = %s]\n", fRandom ? "yes" : "no");
    Abc_Print(-2, "\t-i     : toggle using primary inputs as support variables [default = %s]\n", fInputs ? "yes" : "no");
    Abc_Print(-2, "\t-v     : toggle printing verbose information [default = %s]\n", fVerbose ? "yes" : "no");
    Abc_Print(-2, "\t-w     : toggle printing more verbose information [default = %s]\n", fVeryVerbose ? "yes" : "no");
    Abc_Print(-2, "\t-h     : print the command usage\n");
    return 1;
}

/**Function*************************************************************

  Synopsis    [Start / Stop the eda package]

  Description []

  SideEffects []

  SeeAlso     []

***********************************************************************/

void init(Abc_Frame_t *pAbc)
{
    Cmd_CommandAdd(pAbc, "z EDA", "hello", Eda_CommandHello, 0);
    Cmd_CommandAdd(pAbc, "z EDA", "runfindtarget", Eda_CommandRunFindTarget, 0);
}

void destroy(Abc_Frame_t *pAbc) {}

Abc_FrameInitializer_t frame_intializer = {init, destroy};

struct registrar
{
    registrar()
    {
        Abc_FrameAddInitializer(&frame_intializer);
    }
} eda_registrar;