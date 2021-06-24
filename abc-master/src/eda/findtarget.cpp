#include "base/acb/acb.h"
// #include "base/acb/acbFunc.c"

void Eda_NtkRunFindTarget( char * pFileNames[6], int nTimeout, int fCheck, int fRandom, int fInputs, int fVerbose, int fVeryVerbose )
{
    extern Acb_Ntk_t * Acb_VerilogSimpleRead( char * pFileName, char * pFileNameW );
    extern void Acb_NtkRunEco( char * pFileNames[4], int nTimeout, int fCheck, int fRandom, int fInputs, int fVerbose, int fVeryVerbose );
    char Command[1000]; int Result = 1;
    Acb_Ntk_t * pNtkF = Acb_VerilogSimpleRead( pFileNames[0], pFileNames[4] );
    Acb_Ntk_t * pNtkG = Acb_VerilogSimpleRead( pFileNames[1], NULL );
    if ( !pNtkF || !pNtkG )
        return;
    //int * pArray = Vec_IntArray( &pNtkF->vTargets );
    //ABC_SWAP( int, pArray[7], pArray[4] );
    //Vec_IntReverseOrder( &pNtkF->vTargets );
    if ( fRandom )
    {
        // printf( "Permuting targets as follows:   " );
        // Vec_IntPermute( &pNtkF->vTargets );
        // Vec_IntPrint( &pNtkF->vTargets );
        printf( "Not implemented yet.\n" );
        return;
    }

    assert( Acb_NtkCiNum(pNtkF) == Acb_NtkCiNum(pNtkG) );
    assert( Acb_NtkCoNum(pNtkF) == Acb_NtkCoNum(pNtkG) );

    printf("will find target here.\n");

    char * pFileNamesNew[4] = {NULL};
    pFileNamesNew[0] = pFileNames[0];
    pFileNamesNew[1] = pFileNames[1];
    pFileNamesNew[2] = pFileNames[4];
//     Acb_IntallLibrary( Abc_FrameReadSignalNames() != NULL );


//     if ( !Acb_NtkEcoPerform( pNtkF, pNtkG, pFileNames, nTimeout, 0, fInputs, fCheck, fVerbose, fVeryVerbose ) )
//     {
// //        printf( "General computation timed out. Trying inputs only.\n\n" );
// //        if ( !Acb_NtkEcoPerform( pNtkF, pNtkG, pFileNames, nTimeout, 1, fInputs, fCheck, fVerbose, fVeryVerbose ) )
// //            printf( "Input-only computation also timed out.\n\n" );
//         printf( "Computation did not succeed.\n" );
//         Result = 0;
//     }

//     Acb_ManFree( pNtkF->pDesign );
//     Acb_ManFree( pNtkG->pDesign );

//     // verify the result
//     sprintf( Command, "read %s; strash; write temp1.aig; read %s; strash; write temp2.aig; &cec temp1.aig temp2.aig", 
//         pFileNames[1], pFileNames[3] ? pFileNames[3] : "out.v" );
//     if ( Result && Cmd_CommandExecute( Abc_FrameGetGlobalFrame(), Command ) )
//         fprintf( stdout, "Cannot execute command \"%s\".\n", Command );
//     printf( "\n" );
}
