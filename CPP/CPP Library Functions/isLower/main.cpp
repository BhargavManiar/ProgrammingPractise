#include <cwctype> // This is the new new library we are using. 
#include <iostream>
using namespace std;

int main() {
	wchar_t rs1 = 'H';
	wchar_t rs2 = 'e';
	wchar_t rs3 = 'l';
	wchar_t rs4 = 'P';
	
	// Function to check if the character is lower case or not. 
	
	
	if(iswlower(rs1)) {
		wcout << rs1 << " is a lowercase ";
	} else {
		wcout << rs1 << " is not lowercase";
	}
	
	wcout << endl;
	
	if(iswlower(rs2)) {
		wcout << rs2 << " is a lowercase ";
	} else {
		wcout << rs2 << " is not lowercase";
	}
	
	wcout << endl;
	
	if(iswlower(rs3)) {
		wcout << rs3 << " is a lowercase ";
	} else {
		wcout << rs3 << " is not lowercase";
	}
	
	wcout << endl;
	
	if(iswlower(rs4)) {
		wcout << rs4 << " is a lowercase ";
	} else {
		wcout << rs4 << "is not lowercase";
	}
	
	wcout << endl;
	
	return 0;
}