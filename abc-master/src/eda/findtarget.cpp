#include "base/acb/acb.h"
#include "base/abc/abc.h"
#include "base/main/main.h"
#include "base/main/mainInt.h"
// #include "base/acb/acbFunc.c"
#include <iostream>
#include <fstream>
#include <queue>
using namespace std;

static inline char *myTypeName(Acb_Ntk_t *p, int iObj)
{
    int type = Acb_ObjType(p, iObj);
    switch (type)
    {
    case ABC_OPER_BIT_BUF:
        return "buf";
    case ABC_OPER_BIT_INV:
        return "not";
    case ABC_OPER_BIT_AND:
        return "and";
    case ABC_OPER_BIT_NAND:
        return "nand";
    case ABC_OPER_BIT_OR:
        return "or";
    case ABC_OPER_BIT_NOR:
        return "nor";
    case ABC_OPER_BIT_XOR:
        return "xor";
    case ABC_OPER_BIT_NXOR:
        return "nxor";
    case ABC_OPER_CONST_F:
        return "1'b0";
    case ABC_OPER_CONST_T:
        return "1'b1";
    case ABC_OPER_NONE:
        return "UNUSED";
    case ABC_OPER_PI:
        return "INPUT"; // 01  input
    case ABC_OPER_PO:
        return "OUTPUT"; // 02  output
    case ABC_OPER_CI:
        return "COMIN"; // 03  combinational input
    case ABC_OPER_CO:
        return "COMOUT"; // 04  conbinational output
    default:
        return "UNDEF";
    }
}
static inline void printFanins(int level, Acb_Ntk_t *p, int iObj)
{
    for (int i = 0; i < level; i++)
    {
        printf(" ");
    }
    printf("num= %d, name= %s\n", iObj, Acb_ObjNameStr(p, iObj));
    int objk, k;
    Acb_ObjForEachFanin(p, iObj, objk, k)
    {
        printFanins(level + 1, p, objk);
    }
}
static inline void myPrimeStructuralhashing(long long &prevhash, int type)
{
    switch (type)
    {
    case ABC_OPER_BIT_BUF:
        prevhash *= 2;
        break;
    case ABC_OPER_BIT_INV:
        prevhash *= 3;
        break;
    case ABC_OPER_BIT_AND:
        prevhash *= 5;
        break;
    case ABC_OPER_BIT_NAND:
        prevhash *= 7;
        break;
    case ABC_OPER_BIT_OR:
        prevhash *= 11;
        break;
    case ABC_OPER_BIT_NOR:
        prevhash *= 13;
        break;
    case ABC_OPER_BIT_XOR:
        prevhash *= 17;
        break;
    case ABC_OPER_BIT_NXOR:
        prevhash *= 19;
        break;
    case ABC_OPER_CONST_F:
        prevhash *= 23;
        break;
    case ABC_OPER_CONST_T:
        prevhash *= 29;
        break;
    }
}
static inline void printObj(Acb_Ntk_t *p, int _obj, char *head = "Obj")
{
    printf("%s: %5d, %10s, %s\n", head, _obj, Acb_ObjNameStr(p, _obj), myTypeName(p, _obj));
}
static inline void printLevelAll(Acb_Ntk_t *p, queue<int> _level, char *head = "Obj")
{
    while (!_level.empty())
    {
        printObj(p, _level.front(), head);
        _level.pop();
    }
    printf("\n");
}
static inline void writeFile(ostream &os, Acb_Ntk_t *p, queue<int> &to_put_target)
{
    vector<bool> is_target;
    int t_count = 0, t_max = to_put_target.size();
    is_target.reserve(Acb_NtkObjNumMax(p));
    for (int i = 0; i < Acb_NtkObjNumMax(p); i++)
    {
        is_target.push_back(false);
    }
    while (!to_put_target.empty())
    {
        is_target.at(to_put_target.front()) = true;
        to_put_target.pop();
    }
    os << "module top(";
    int iObj, i;
    bool first = true;
    Acb_NtkForEachCi(p, iObj, i)
    {
        if (!first)
        {
            os << ", ";
        }
        else
        {
            first = false;
        }
        os << Acb_ObjNameStr(p, iObj);
    }
    Acb_NtkForEachCo(p, iObj, i)
    {
        if (!first)
        {
            os << ", ";
        }
        else
        {
            first = false;
        }
        os << Acb_ObjNameStr(p, iObj);
    }
    os << ");" << endl;

    first = true;
    os << "  input ";
    Acb_NtkForEachCi(p, iObj, i)
    {
        if (!first)
        {
            os << ", ";
        }
        else
        {
            first = false;
        }
        os << Acb_ObjNameStr(p, iObj);
    }
    os << ";" << endl;
    first = true;
    os << "  output ";
    Acb_NtkForEachCo(p, iObj, i)
    {
        if (!first)
        {
            os << ", ";
        }
        else
        {
            first = false;
        }
        os << Acb_ObjNameStr(p, iObj);
    }
    os << ";" << endl;

    first = true;
    os << "  wire ";
    Acb_NtkForEachObj(p, iObj)
    {
        if (Acb_ObjType(p, iObj) == ABC_OPER_CI || Acb_ObjType(p, iObj) == ABC_OPER_CO)
        {
            continue;
        }
        if (!first)
        {
            os << ", ";
        }
        else
        {
            first = false;
        }
        os << Acb_ObjNameStr(p, iObj);
    }
    os << ";" << endl;

    if (t_max){
        os << "  wire ";
    }
    for (int i = 0; i < t_max; i++)
    {
        if (i)
        {
            os << ", ";
        }
        os << "t_" << i;
    }
    os << ";" << endl;

    Acb_NtkForEachObj(p, iObj)
    {
        if (Acb_ObjType(p, iObj) == ABC_OPER_CI || Acb_ObjType(p, iObj) == ABC_OPER_CO)
        {
            continue;
        }
        int fanin, k;
        os << "  " << myTypeName(p, iObj) << " ga" << iObj << " (" << Acb_ObjNameStr(p, iObj);
        if (is_target.at(iObj))
        {
            os << ", t_" << t_count;
            t_count++;
            // printObj(p, iObj, "Target");
        }
        Acb_ObjForEachFanin(p, iObj, fanin, k)
        {
            os << ", " << Acb_ObjNameStr(p, fanin);
        }
        os << ");" << endl;
    }
    os << "endmodule" << endl;
}

static inline void DFS_buf(Acb_Ntk_t *p, int iObj, queue<int> &put_into_queue, int prevType);
static inline void DFS_inv(Acb_Ntk_t *p, int iObj, queue<int> &put_into_queue, int prevType);
static inline void DFS_and(Acb_Ntk_t *p, int iObj, queue<int> &put_into_queue);
static inline void DFS_or(Acb_Ntk_t *p, int iObj, queue<int> &put_into_queue);

static inline void DFS_buf(Acb_Ntk_t *p, int iObj, queue<int> &put_into_queue, int prevType = ABC_OPER_BIT_BUF)
{
    int objk, k;
    Acb_ObjForEachFanin(p, iObj, objk, k)
    {
        switch (Acb_ObjType(p, objk))
        {
        case ABC_OPER_BIT_INV:
        {
            int objm, m;
            Acb_ObjForEachFanin(p, objk, objm, m)
            {
                switch (Acb_ObjType(p, objm))
                {
                case ABC_OPER_BIT_INV:
                    DFS_buf(p, objm, put_into_queue, prevType);
                    break;
                case ABC_OPER_BIT_BUF:
                    DFS_inv(p, objm, put_into_queue, prevType);
                    break;
                default:
                    put_into_queue.push(objm);
                    break;
                }
            }
        }
        case ABC_OPER_BIT_BUF:
            DFS_buf(p, objk, put_into_queue);
            break;
        case ABC_OPER_BIT_AND:
            if (prevType == ABC_OPER_BIT_AND || prevType == ABC_OPER_BIT_NAND)
            {
                DFS_and(p, objk, put_into_queue);
            }
            else
            {
                put_into_queue.push(objk);
            }
            break;
        case ABC_OPER_BIT_OR:
            if (prevType == ABC_OPER_BIT_OR || prevType == ABC_OPER_BIT_NOR)
            {
                DFS_or(p, objk, put_into_queue);
            }
            else
            {
                put_into_queue.push(objk);
            }
            break;
        default:
            put_into_queue.push(objk);
            break;
        }
    }
}
static inline void DFS_inv(Acb_Ntk_t *p, int iObj, queue<int> &put_into_queue, int prevType = ABC_OPER_BIT_BUF)
{
    int objk, k;
    Acb_ObjForEachFanin(p, iObj, objk, k)
    {
        switch (Acb_ObjType(p, objk))
        {
        case ABC_OPER_BIT_INV:
            DFS_buf(p, objk, put_into_queue, prevType);
            break;
        case ABC_OPER_BIT_BUF:
            DFS_inv(p, objk, put_into_queue, prevType);
            break;
        default:
            put_into_queue.push(objk);
        }
    }
}
static inline void DFS_and(Acb_Ntk_t *p, int iObj, queue<int> &put_into_queue)
{
    int objk, k;
    Acb_ObjForEachFanin(p, iObj, objk, k)
    {
        switch (Acb_ObjType(p, objk))
        {
        case ABC_OPER_BIT_INV:
        {
            int objm, m;
            Acb_ObjForEachFanin(p, objk, objm, m)
            {
                DFS_inv(p, objm, put_into_queue, ABC_OPER_BIT_AND);
            }
            break;
        }
        case ABC_OPER_BIT_AND:
        case ABC_OPER_BIT_BUF:
            DFS_and(p, objk, put_into_queue);
            break;
        default:
            put_into_queue.push(objk);
            break;
        }
    }
}
static inline void DFS_or(Acb_Ntk_t *p, int iObj, queue<int> &put_into_queue)
{
    int objk, k;
    Acb_ObjForEachFanin(p, iObj, objk, k)
    {
        switch (Acb_ObjType(p, objk))
        {
        case ABC_OPER_BIT_INV:
        {
            int objm, m;
            Acb_ObjForEachFanin(p, objk, objm, m)
            {
                DFS_inv(p, objm, put_into_queue, ABC_OPER_BIT_OR);
            }
            break;
        }
        case ABC_OPER_BIT_OR:
        case ABC_OPER_BIT_BUF:
            DFS_or(p, objk, put_into_queue);
            break;
        default:
            put_into_queue.push(objk);
            break;
        }
    }
}

static inline void myGetNextLevel(Acb_Ntk_t *pNtk, queue<int> &_fromLevel, queue<int> &_oldLevel, long long &_prevHash, int fVerbose = 0)
{
    int _obj, _fanin, _k;
    queue<int> _tmpLevel;
    _oldLevel = _fromLevel;
    while (!_fromLevel.empty())
    {
        _obj = _fromLevel.front();
        if (fVerbose)
        {
            // printf("Obj: %5d, %5s, type= %s\n", _obj, Acb_ObjNameStr(pNtk, _obj), myTypeName(pNtk, _obj));
            printObj(pNtk, _obj);
        }
        switch (Acb_ObjType(pNtk, _fromLevel.front()))
        {
        case ABC_OPER_BIT_AND:
        case ABC_OPER_BIT_NAND:
            DFS_and(pNtk, _fromLevel.front(), _tmpLevel);
            break;
        case ABC_OPER_BIT_OR:
        case ABC_OPER_BIT_NOR:
            DFS_or(pNtk, _fromLevel.front(), _tmpLevel);
            break;
        // case ABC_OPER_BIT_INV:
        //     DFS_inv(pNtk, _fromLevel.front(), _tmpLevel)
        default:
            Acb_ObjForEachFanin(pNtk, _fromLevel.front(), _fanin, _k)
            {
                switch (Acb_ObjType(pNtk, _fanin))
                {
                case ABC_OPER_BIT_BUF:
                    DFS_buf(pNtk, _fromLevel.front(), _tmpLevel);
                    break;
                case ABC_OPER_BIT_INV:
                    DFS_inv(pNtk, _fromLevel.front(), _tmpLevel);
                    break;
                default:
                    _tmpLevel.push(_fanin);
                }
            }
            break;
        }
        // Acb_ObjForEachFanin(pNtkF, _fromLevel.front(), fanin, k){
        //     myPrimeStructuralhashing(ObjTypeHashF, Acb_ObjType(pNtkF, fanin));
        // }
        _fromLevel.pop();
    }
    while (!_tmpLevel.empty())
    {
        _fromLevel.push(_tmpLevel.front());
        myPrimeStructuralhashing(_prevHash, Acb_ObjType(pNtk, _tmpLevel.front()));
        _tmpLevel.pop();
    }
}

void Eda_NtkRunFindTarget(char *pFileNames[5], int nTimeout, int fCheck, int fRandom, int fInputs, int fVerbose, int fVeryVerbose)
{
    extern Acb_Ntk_t *Acb_VerilogSimpleRead(char *pFileName, char *pFileNameW);
    // extern void Acb_NtkRunEco(char *pFileNames[4], int nTimeout, int fCheck, int fRandom, int fInputs, int fVerbose, int fVeryVerbose);
    // char Command[1000];
    // int Result = 1;
    Acb_Ntk_t *pNtkF = Acb_VerilogSimpleRead(pFileNames[0], pFileNames[3]);
    Acb_Ntk_t *pNtkG = Acb_VerilogSimpleRead(pFileNames[1], NULL);
    if (!pNtkF || !pNtkG)
        return;
    //int * pArray = Vec_IntArray( &pNtkF->vTargets );
    //ABC_SWAP( int, pArray[7], pArray[4] );
    //Vec_IntReverseOrder( &pNtkF->vTargets );
    if (fRandom)
    {
        // printf( "Permuting targets as follows:   " );
        // Vec_IntPermute( &pNtkF->vTargets );
        // Vec_IntPrint( &pNtkF->vTargets );
        printf("Not implemented yet.\n");
        return;
    }

    assert(Acb_NtkCiNum(pNtkF) == Acb_NtkCiNum(pNtkG));
    assert(Acb_NtkCoNum(pNtkF) == Acb_NtkCoNum(pNtkG));

    printf("Finding target ...\n");
    int iterF, iterG, objF, objG;
    if (fVeryVerbose)
    {
        printf("\nBy Ntk Order...\n");
        Acb_NtkForEachObj(pNtkF, iterF)
        {
            printf("Obj, num= %d, name= %s, type= %d\n", iterF, Acb_ObjNameStr(pNtkF, iterF), Acb_ObjType(pNtkF, iterF));
        }
    }

    // DFS
    if (fVeryVerbose)
    {
        printf("\nDFS...\n");
        Acb_NtkForEachCo(pNtkF, objF, iterF)
        {
            printf("Co, num= %d, name= %s\n", objF, Acb_ObjNameStr(pNtkF, objF));
            printFanins(1, pNtkF, objF);
        }
    }

    // BFS
    // TODO

    // BFS with DFS and compair
    // printf("\nBFS...\n");
    // int ObjAmountF = Acb_NtkObjNum(pNtkF), ObjAmountG = Acb_NtkObjNum(pNtkG);
    // int NtkObjColorF[ObjAmountF], NtkObjColorG[ObjAmountG]; // traversed: 1
    // int NtkObjdF[ObjAmountF], NtkObjdG[ObjAmountG];         // root: 0
    long long ObjTypeHashF = 1, ObjTypeHashG = 1;
    // for (int i = 0; i < ObjAmountF; i++)
    // {
    //     NtkObjColorF[i] = 0;
    //     NtkObjdF[i] = 0;
    //     NtkObjColorG[i] = 0;
    //     NtkObjdG[i] = 0;
    // }
    queue<int> NtkNextLevelF, NtkNextLevelG, NtkPrevLevelF, NtkPrevLevelG;
    Acb_NtkForEachCo(pNtkF, objF, iterF)
    {
        int fanin, k;
        Acb_ObjForEachFanin(pNtkF, objF, fanin, k)
        {
            NtkNextLevelF.push(fanin);
        }
        // NtkObjColorF[objF] ^= 1;
    }
    Acb_NtkForEachCo(pNtkG, objG, iterG)
    {
        int fanin, k;
        Acb_ObjForEachFanin(pNtkG, objG, fanin, k)
        {
            NtkNextLevelG.push(fanin);
        }
        // NtkObjColorG[objG] ^= 1;
    }
    while (!NtkNextLevelF.empty() && !NtkNextLevelG.empty())
    {
        myGetNextLevel(pNtkF, NtkNextLevelF, NtkPrevLevelF, ObjTypeHashF, fVerbose);
        myGetNextLevel(pNtkG, NtkNextLevelG, NtkPrevLevelG, ObjTypeHashG, fVerbose);
        if (ObjTypeHashF != ObjTypeHashG)
        {
            if (fVerbose)
            {
                cout << "Difference detected.\n"
                     << "F= " << ObjTypeHashF << endl
                     << "G= " << ObjTypeHashG << endl;
                printLevelAll(pNtkF, NtkNextLevelF, "ObjF_Next");
                printLevelAll(pNtkG, NtkNextLevelG, "ObjG_Next");
                printLevelAll(pNtkF, NtkPrevLevelF, "ObjF_Prev");
                printLevelAll(pNtkG, NtkPrevLevelG, "ObjG_Prev");
            }
            break;
        }
        else
        {
            cout << "no diff in this level." << endl;
        }
    }
    fstream fout;
    if (pFileNames[2] != NULL){
        cout << "Writing target to " << pFileNames[2] << endl;
        fout.open(pFileNames[2], ios::out);
    }
    else{
        cout << "can't write " << pFileNames[2] << ", write to temp_with_target.v" << endl;
        fout.open("temp_with_target.v", ios::out);
    }
    writeFile(fout, pNtkF, NtkPrevLevelF);

    // char *pFileNamesNew[4] = {NULL};
    // pFileNamesNew[0] = pFileNames[0];
    // pFileNamesNew[1] = pFileNames[1];
    // pFileNamesNew[2] = pFileNames[4];
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
