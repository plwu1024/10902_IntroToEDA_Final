/**CFile****************************************************************

  FileName    [hello.cpp]

  SystemName  [ABC: Logic synthesis and verification system.]

  PackageName [Hello EDA]

  Synopsis    [Command file.]

  Author      [im701-study, ezpz00, plwu1024]

  Affiliation [NTU]

  Date        [Ver. 1.0. Started - June 24, 2021.]

***********************************************************************/

#include "eda.h"
#include <iostream>

////////////////////////////////////////////////////////////////////////
///                        DECLARATIONS                              ///
////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////
///                     FUNCTION DEFINITIONS                         ///
////////////////////////////////////////////////////////////////////////

void Eda_Hello(int fVerbose){
    std::cout << "Hello from EDA!" << std::endl;
    if (fVerbose){
        std::cout << "We are working on 2021 Problem A" << std::endl;
    }
    return;
}