#include <cwctype>
#include <iostream>
using namespace std;

int main() {
	wchar_t rs1 = 'H';
	wchar_t rs2 = 'e';
	wchar_t rs3 = 'l';
	wchar_t rs4 = 'p';

	wchar_t rs5 = '.';
	wchar_t rs6 = 'C';
	wchar_t rs7 = '@';
	wchar_t rs8 = 'M';
		
	// Function to check if the character is uppercase or not
	
	if(iswupper(rs1)) {
		wcout << rs1 << " is uppercase"; // the W will convert the numerial value of rs1 to a character 
	} else { 
		wcout << rs1 << " is not uppercase";
	}
	
	wcout << endl;


	if(iswupper(rs2)) {
		wcout << rs2 << " is uppercase";
	} else { 
		wcout << rs2 << " is not uppercase";
	}
	
	wcout << endl;
	
	if(iswupper(rs3)) {
		wcout << rs3 << " is uppercase";
	} else { 
		wcout << rs3 << " is not uppercase";
	}
	
	wcout << endl;
	
	if(iswupper(rs4)) {
		wcout << rs4 << " is uppercase";
	} else { 
		wcout << rs4 << " is not uppercase";
	}
	
	wcout << endl;
	
	if(iswupper(rs5)) {
		wcout << rs5 << " is uppercase";
	} else { 
		wcout << rs5 << " is not uppercase";
	}
	
	wcout << endl;
	
	if(iswupper(rs6)) {
		wcout << rs6 << " is uppercase";
	} else { 
		wcout << rs6 << " is not uppercase";
	}
	
	wcout << endl;
	
	if(iswupper(rs7)) {
		wcout << rs7 << " is uppercase";
	} else { 
		wcout << rs7 << " is not uppercase";
	}
	
	wcout << endl;
	
	if(iswupper(rs8)) {
		wcout << rs8 << " is uppercase";
	} else { 
		wcout << rs8 << " is not uppercase";
	}
	
	wcout << endl;
	
	return 0;
}