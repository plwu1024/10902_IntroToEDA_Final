#include <iostream>
#include <string.h>
using namespace std;

int main () {
  string a;
  string b;
  cin >> a;
  cin >> b;
  if (a.compare(b)){
    cout << "true";
  }
  return 0;
}