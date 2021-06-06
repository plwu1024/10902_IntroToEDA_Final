// +---------------------------------------
// | Author         plwu1024
// | Last modified  plwu1024, 2020/06/05
// +---------------------------------------

#include <iostream>
#include <fstream>
#include <string>
#include <vector>
using namespace std;

void cout_usage()
{
    cout << "Usage:" << endl;
    cout << "\t./eco R1.v R2.v G1.v patch.v" << endl;
    cout << "Arguments in wrong format will be ignored." << endl;
}

void strip(string &_s, const string &_unwanted_str)
{
    int _from = _s.find_first_not_of(_unwanted_str);
    int _to = _s.find_last_not_of(_unwanted_str);
    if (_from == string::npos)
    {
        return;
    }
    _s = _s.substr(_from, _to - _from + 1);
}

bool myparse(string &_tmp, string &_lineBuf)
{
    // extract the first word from _lineBuf.
    // if can't get any, return false.
    strip(_lineBuf, " ,();");
    _tmp = _lineBuf.substr(0, _lineBuf.find_first_of(" ,();"));
    _lineBuf = _lineBuf.substr(_tmp.length());
    return _tmp.length();
}

enum Logic
{
    logic_and,
    logic_or,
    logic_nand,
    logic_nor,
    logic_not,
    logic_buf,
    logic_xor,
    logic_xnor
};

class Gate
{
public:
    char type;
    string name;
    string output;
    vector<string> inputs;
    friend ostream &operator<<(ostream &os, Gate &_gate);
    Gate(char _type)
    {
        type = _type;
    };
    ~Gate(){};
};
ostream &operator<<(ostream &os, Gate &_gate)
{
    switch (_gate.type)
    {
    case logic_and:
        os << "and";
        break;
    case logic_or:
        os << "or";
        break;
    case logic_nand:
        os << "nand";
        break;
    case logic_nor:
        os << "nor";
        break;
    case logic_not:
        os << "not";
        break;
    case logic_buf:
        os << "buf";
        break;
    case logic_xor:
        os << "xor";
        break;
    case logic_xnor:
        os << "xnor";
        break;
    default:
        os << "undefined";
        break;
    }
    os << ' ' << _gate.name << " (" << _gate.output;
    for (auto it = _gate.inputs.begin(); it != _gate.inputs.end(); ++it)
    {
        os << ", " << *it;
    }
    os << ");";
    return os;
}

class Netlist
{
public:
    Netlist(ifstream &_f);
    Netlist();
    ~Netlist();
    string name;
    vector<string> inputs;
    vector<string> outputs;
    vector<string> wires;
    vector<Gate> gates;

    void addInput(string _new_input)
    {
        inputs.push_back(_new_input);
    }
    void addOutput(string _new_output)
    {
        outputs.push_back(_new_output);
    }
    void addWire(string _new_wire)
    {
        wires.push_back(_new_wire);
    }
    void addGate(Gate _new_gate)
    {
        gates.push_back(_new_gate);
    }
};
Netlist::Netlist(ifstream &_f)
{
    string _lineBuf;
    string _identifier;
    string _tmp;
    while (getline(_f, _lineBuf))
    {
        strip(_lineBuf, " ,();");
        myparse(_identifier, _lineBuf);
        cout << "---" << _identifier << "---" << endl;
        if (!_identifier.compare("and"))
        {
            gates.push_back(Gate(logic_and));
            myparse(_tmp, _lineBuf);
            gates.at(gates.size() - 1).name = _tmp;
            myparse(_tmp, _lineBuf);
            gates.at(gates.size() - 1).output = _tmp;
            while (myparse(_tmp, _lineBuf))
            {
                gates.at(gates.size() - 1).inputs.push_back(_tmp);
            }
            cout << "Gate: " << gates.at(gates.size() - 1) << endl;
        }
        else if (!_identifier.compare("or"))
        {
            gates.push_back(Gate(logic_or));
            myparse(_tmp, _lineBuf);
            gates.at(gates.size() - 1).name = _tmp;
            myparse(_tmp, _lineBuf);
            gates.at(gates.size() - 1).output = _tmp;
            while (myparse(_tmp, _lineBuf))
            {
                gates.at(gates.size() - 1).inputs.push_back(_tmp);
            }
            cout << "Gate: " << gates.at(gates.size() - 1) << endl;
        }
        else if (!_identifier.compare("nand"))
        {
            gates.push_back(Gate(logic_nand));
            myparse(_tmp, _lineBuf);
            gates.at(gates.size() - 1).name = _tmp;
            myparse(_tmp, _lineBuf);
            gates.at(gates.size() - 1).output = _tmp;
            while (myparse(_tmp, _lineBuf))
            {
                gates.at(gates.size() - 1).inputs.push_back(_tmp);
            }
            cout << "Gate: " << gates.at(gates.size() - 1) << endl;
        }
        else if (!_identifier.compare("nor"))
        {
            gates.push_back(Gate(logic_nor));
            myparse(_tmp, _lineBuf);
            gates.at(gates.size() - 1).name = _tmp;
            myparse(_tmp, _lineBuf);
            gates.at(gates.size() - 1).output = _tmp;
            while (myparse(_tmp, _lineBuf))
            {
                gates.at(gates.size() - 1).inputs.push_back(_tmp);
            }
            cout << "Gate: " << gates.at(gates.size() - 1) << endl;
        }
        else if (!_identifier.compare("not"))
        {
            gates.push_back(Gate(logic_not));
            myparse(_tmp, _lineBuf);
            gates.at(gates.size() - 1).name = _tmp;
            myparse(_tmp, _lineBuf);
            gates.at(gates.size() - 1).output = _tmp;
            while (myparse(_tmp, _lineBuf))
            {
                gates.at(gates.size() - 1).inputs.push_back(_tmp);
            }
            cout << "Gate: " << gates.at(gates.size() - 1) << endl;
        }
        else if (!_identifier.compare("buf"))
        {
            gates.push_back(Gate(logic_buf));
            myparse(_tmp, _lineBuf);
            gates.at(gates.size() - 1).name = _tmp;
            myparse(_tmp, _lineBuf);
            gates.at(gates.size() - 1).output = _tmp;
            while (myparse(_tmp, _lineBuf))
            {
                gates.at(gates.size() - 1).inputs.push_back(_tmp);
            }
            cout << "Gate: " << gates.at(gates.size() - 1) << endl;
        }
        else if (!_identifier.compare("xor"))
        {
            gates.push_back(Gate(logic_xor));
            myparse(_tmp, _lineBuf);
            gates.at(gates.size() - 1).name = _tmp;
            myparse(_tmp, _lineBuf);
            gates.at(gates.size() - 1).output = _tmp;
            while (myparse(_tmp, _lineBuf))
            {
                gates.at(gates.size() - 1).inputs.push_back(_tmp);
            }
            cout << "Gate: " << gates.at(gates.size() - 1) << endl;
        }
        else if (!_identifier.compare("xnor"))
        {
            gates.push_back(Gate(logic_xnor));
            myparse(_tmp, _lineBuf);
            gates.at(gates.size() - 1).name = _tmp;
            myparse(_tmp, _lineBuf);
            gates.at(gates.size() - 1).output = _tmp;
            while (myparse(_tmp, _lineBuf))
            {
                gates.at(gates.size() - 1).inputs.push_back(_tmp);
            }
            cout << "Gate: " << gates.at(gates.size() - 1) << endl;
        }
        else if (!_identifier.compare("module"))
        {
            if (name.compare(""))
            {
                cerr << "warning: the module has duplicate name declaration. the latter one is ignored.";
            }
            else
            {
                myparse(_tmp, _lineBuf);
                name = _tmp;
                cout << "Name: " << name << endl;
            }
        }
        else if (!_identifier.compare("input"))
        {
            while (myparse(_tmp, _lineBuf))
            {
                inputs.push_back(_tmp);
                cout << "Input Added: \t" << _tmp << endl;
            }
        }
        else if (!_identifier.compare("output"))
        {
            while (myparse(_tmp, _lineBuf))
            {
                outputs.push_back(_tmp);
                cout << "Output Added: \t" << _tmp << endl;
            }
        }
        else if (!_identifier.compare("wire"))
        {
            while (myparse(_tmp, _lineBuf))
            {
                wires.push_back(_tmp);
                cout << "Wire Added:  \t" << _tmp << endl;
            }
        }
        else if (!_identifier.compare("endmodule"))
        {
            break;
        }
    }
}

Netlist::~Netlist()
{
}

int main(int argc, char *argv[])
{
    if (argc != 5)
    {
        cout_usage();
        // cout << "Using default: ";
        return 1;
    }

    ifstream fileR1(argv[1]), fileR2(argv[2]), fileG1(argv[3]);
    ofstream filePatch(argv[4]);
    if (!fileR1 || !fileR2 || !fileG1 || !filePatch)
    {
        cerr << "Can't open files." << endl;
        return 1;
    }
    Netlist R1 = Netlist(fileR1);
    Netlist R2 = Netlist(fileR2);
    Netlist G1 = Netlist(fileG1);
    return 0;
}