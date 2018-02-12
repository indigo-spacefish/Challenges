//This program will take input from the user regarding their name and email address.
//Then the user will be prompted to generate a random integer between 10-99 to use
//as a seed for making a cipher that will convert their personal info into a barcode.

#include <iostream>
#include <cctype>
#include <cstring>

using namespace std;

const int MAX = 21;     //Max length of a name or email
const int SPACE = 32;   //ascii of space char
const int AT_SIGN = 64; //ascii of a @
const int DOT = 46;     //ascii of a period

//Function Prototypes
void get_name(char name[], int & name_length, char & first_name_char);
bool valid_name(char name[], int length);
void get_email(char email[], int & email_length);
bool valid_email(char email[], int length);
void get_cipher_seed(int & cipher_seed);
void create_cipher(int cipher[], int seed, char first_name_char);
void encode_inputs(char user_name[], int name_length, char user_email[], int email_length, int cipher[],
		  int encoded_name[], int encoded_email[]);
int encode(int cipher[], char index_char);
char decode(int cipher[], int index_int);
char decode_char(int cipher[], char index_char);

int main()
{
	//Variables
	char user_name[MAX];
	char user_email[MAX];
	int name_length;
	int email_length;
	int cipher_seed; //User generated seed for the cipher, 10-99
	int cipher[25];
	char first_name_char;
	int encoded_name[MAX];
	int encoded_email[MAX];
	char decode_response;
	int user_barcode[MAX];
	int barcode_input;
	int barcode_iterator = 0;
	int user_barcode_length;
	bool entering_barcode = true;
	bool still_decoding = true;
	char done_decoding;
	char done_entering;

	//Welcome the user to the program
	cout << endl << endl << "Welcome to BarCODE. You will be prompted to enter a name and" << endl;
	cout << "email address to be converted into a scannable barcode." << endl << endl;

	//Begin gathering user input
	get_name(user_name, name_length, first_name_char);
	get_email(user_email, email_length);
	get_cipher_seed(cipher_seed);
	create_cipher(cipher, cipher_seed, first_name_char);
	encode_inputs(user_name, name_length, user_email, email_length, cipher, encoded_name, encoded_email);

	//Ask the user if they want to decode the encrypted name and email
	cout << "To decode the encrypted name and email enter (D)." << endl;
	cout << "You may instead manually decode a barcode by entering (M)." << endl;
	cout << "Please enter 'D', 'M', or any other key to end the program:  " << endl;
	cin >> decode_response;
	cin.ignore(100, '\n');

	if (toupper(decode_response) == 'D')
	{
		cout << "Decoded name is ";
		for (int i = 0; i < name_length; ++i)
		{
			if (encoded_name[i] == SPACE)
			{
				cout << ' ';
			} else {
				cout << decode(cipher, encoded_name[i]);
			}
		}
		cout << endl;

		cout << "Decoded email is ";
		for (int e = 0; e < email_length; ++e)
		{
			if (encoded_email[e] == AT_SIGN)
			{
				cout << '@';
			}
			if (encoded_email[e] == DOT)
			{
				cout << '.';
			}
			if (encoded_email[e] != AT_SIGN && encoded_email[e] != DOT)
			{
				cout << decode(cipher, encoded_email[e]);
			}
		}
		cout << endl;

	}

	if(toupper(decode_response) == 'M')
	{
		while (still_decoding == true)
		{
			cout << "Please provide encrypted barcode segment by entering a pair of digits (do not decode unencrypted symbols, e.g. '@')." << endl;

			while (entering_barcode == true)
			{
				cout << "Enter a value: " << endl;
				cin >> barcode_input;
				cin.ignore(100, '\n');

				user_barcode[barcode_iterator] = barcode_input;
				barcode_iterator += 1;

				cout << "Done enter barcode(Y/N)?" << endl;
				cin >> done_entering;
				cin.ignore(100, '\n');

				if (toupper(done_entering) == 'Y')
				{
					entering_barcode = false;
				}
			}

			user_barcode_length = barcode_iterator;

			cout << "Decoded barcode is: " << endl;

			for (int b = 0; b < user_barcode_length; ++b)
			{
				cout << decode(cipher, user_barcode[b]);
			}

			cout << endl;

			cout << "Done decoding barcodes(Y/N)?" << endl;
			cin >> done_decoding;
			cin.ignore(100, '\n');

			if (toupper(done_decoding) == 'Y')
			{
				still_decoding = false;
			}
		}
	}

	if(toupper(decode_response) != 'D' && toupper(decode_response) != 'M')
	{
		cout << "Thank you for using BarCODE!" << endl;
	}

	return 0;
}


//Encode an individual character
int encode(int cipher[], char index_char)
{
	switch(toupper(index_char))
	{
		case 'A' :
			return cipher[0];

		case 'B' :
			return cipher[1];

		case 'C' :
			return cipher[2];

		case 'D' :
			return cipher[3];

		case 'E' :
			return cipher[4];

		case 'F' :
			return cipher[5];

		case 'G' :
 			return cipher[6];

		case 'H' :
		 	return cipher[7];

		case 'I' :
		 	return cipher[8];

		case 'J' :
 			return cipher[9];

		case 'K' :
		 	return cipher[10];

		case 'L' :
 			return cipher[11];

		case 'M' :
 			return cipher[12];

		case 'N' :
			return cipher[13];

		case 'O' :
 			return cipher[14];

		case 'P' :
 			return cipher[15];

		case 'Q' :
			return cipher[16];

		case 'R' :
 			return cipher[17];

		case 'S' :
		 	return cipher[18];

		case 'T' :
 			return cipher[19];

		case 'U' :
 			return cipher[20];

		case 'V' :
 			return cipher[21];

		case 'W' :
 			return cipher[22];

		case 'X' :
 			return cipher[23];

		case 'Y' :
 			return cipher[24];

		case 'Z' :
 			return cipher[25];

		default :
			return 0;
	}
}


//Decode each int
char decode(int cipher[], int index_int)
{
	if (index_int == cipher[0])
	{
		return 'A';
	}

	if (index_int == cipher[1])
	{
		return 'B';
	}

	if (index_int == cipher[2])
	{
		return 'C';
	}

	if (index_int == cipher[3])
	{
		return 'D';
	}

	if (index_int == cipher[4])
	{
		return 'E';
	}

	if (index_int == cipher[5])
	{
		return 'F';
	}

	if (index_int == cipher[6])
	{
		return 'G';
	}

	if (index_int == cipher[7])
	{
		return 'H';
	}

	if (index_int == cipher[8])
	{
		return 'I';
	}

	if (index_int == cipher[9])
	{
		return 'J';
	}

	if (index_int == cipher[10])
	{
		return 'K';
	}

	if (index_int == cipher[11])
	{
		return 'L';
	}

	if (index_int == cipher[12])
	{
		return 'M';
	}

	if (index_int == cipher[13])
	{
		return 'N';
	}

	if (index_int == cipher[14])
	{
		return 'O';
	}

	if (index_int == cipher[15])
	{
		return 'P';
	}

	if (index_int == cipher[16])
	{
		return 'Q';
	}

	if (index_int == cipher[17])
	{
		return 'R';
	}

	if (index_int == cipher[18])
	{
		return 'S';
	}

	if (index_int == cipher[19])
	{
		return 'T';
	}

	if (index_int == cipher[20])
	{
		return 'U';
	}

	if (index_int == cipher[21])
	{
		return 'V';
	}

	if (index_int == cipher[22])
	{
		return 'W';
	}

	if (index_int == cipher[23])
	{
		return 'X';
	}

	if (index_int == cipher[24])
	{
		return 'Y';
	}

	if (index_int == cipher[25])
	{
		return 'Z';
	}

	if (index_int == AT_SIGN)
	{
		return '@';
	}

	if (index_int == SPACE)
	{
		return ' ';
	}

	if (index_int == DOT)
	{
		return '.';
	}
}


//Decode an individual char
char decode_char(int cipher[], char index_char)
{
	if (index_char == cipher[0])
	{
		return 'A';
	}

	if (index_char == cipher[1])
	{
		return 'B';
	}

	if (index_char == cipher[2])
	{
		return 'C';
	}

	if (index_char == cipher[3])
	{
		return 'D';
	}

	if (index_char == cipher[4])
	{
		return 'E';
	}

	if (index_char == cipher[5])
	{
		return 'F';
	}

	if (index_char == cipher[6])
	{
		return 'G';
	}

	if (index_char == cipher[7])
	{
		return 'H';
	}

	if (index_char == cipher[8])
	{
		return 'I';
	}

	if (index_char == cipher[9])
	{
		return 'J';
	}

	if (index_char == cipher[10])
	{
		return 'K';
	}

	if (index_char == cipher[11])
	{
		return 'L';
	}

	if (index_char == cipher[12])
	{
		return 'M';
	}

	if (index_char == cipher[13])
	{
		return 'N';
	}

	if (index_char == cipher[14])
	{
		return 'O';
	}

	if (index_char == cipher[15])
	{
		return 'P';
	}

	if (index_char == cipher[16])
	{
		return 'Q';
	}

	if (index_char == cipher[17])
	{
		return 'R';
	}

	if (index_char == cipher[18])
	{
		return 'S';
	}

	if (index_char == cipher[19])
	{
		return 'T';
	}

	if (index_char == cipher[20])
	{
		return 'U';
	}

	if (index_char == cipher[21])
	{
		return 'V';
	}

	if (index_char == cipher[22])
	{
		return 'W';
	}

	if (index_char == cipher[23])
	{
		return 'X';
	}

	if (index_char == cipher[24])
	{
		return 'Y';
	}

	if (index_char == cipher[25])
	{
		return 'Z';
	}

	if (index_char == AT_SIGN)
	{
		return '@';
	}

	if (index_char == SPACE)
	{
		return ' ';
	}

	if (index_char == DOT)
	{
		return '.';
	}
}


//Encoded the inputs from get_name and get_email with the cipher
void encode_inputs(char user_name[], int name_length, char user_email[], int email_length,
		   int cipher[], int encoded_name[], int encoded_email[])
{
	//Create encoded name
	for (int i = 0; i < name_length; ++i)
	{
		if (encode(cipher, user_name[i]))
		{
			encoded_name[i] = encode(cipher, user_name[i]);
		} else {
			encoded_name[i] = user_name[i];
		}
	}

	//Create encoded email
	for (int x = 0; x < email_length; ++x)
	{
		if (encode(cipher, user_email[x]))
		{
			encoded_email[x] = encode(cipher, user_email[x]);
		} else {
			encoded_email[x] = user_email[x];
		}
	}

	//Output encoded name and email to the user
	cout << "Encoded Name is ";
	for (int j = 0; j < name_length; ++j)
	{
		if (encoded_name[j] == SPACE)
		{
			cout << ' ';
		} else {
			cout << encoded_name[j];
		}
	}
	cout << endl;

	cout << "Encoded Email is ";
	for (int n = 0; n < email_length; ++n)
	{
		if (encoded_email[n] == AT_SIGN)
		{
			cout << '@';
		}
		if (encoded_email[n] == DOT)
		{
			cout << '.';
		}
		if (encoded_email[n] != AT_SIGN && encoded_email[n] != DOT)
		{
			cout << encoded_email[n];
		}
	}
	cout << endl;
}


//Create a cipher which pairs each letter index with a unique encryption
void create_cipher(int cipher[], int seed, char first_name_char)
{
	int encoded_key = ((seed + first_name_char) % 99);

	int new_key; //Change the iterator so cipher is non-sequential
	cipher[0] = seed;
	for (int i = 1; i < 26; ++i)
	{
		new_key = ((encoded_key * i)+i);

		while(new_key > 99)
		{
			new_key = (new_key % 99);
		}

		while(new_key < 10)
		{
			new_key += i;
		}

		bool unique_check = false;
		while (unique_check == false)
		{
			for (int x = 0; x < i; ++x)
			{
				if (new_key == cipher[x])
				{
					new_key += 1;
				}
			}

			for (int c = i; c >= 0; --c)
			{
				if (new_key == cipher[c])
				{
					new_key += 1;
				}
			}
			unique_check = true;
		}
		cipher[i] = new_key;
	}

	cout << "The Cipher: ";
	for (int n = 0; n < 26; ++n)
	{
		cout << " " << cipher[n] << " ";
	}
	cout << endl;
}


//Function to prompt the user for a cipher seed
void get_cipher_seed(int & cipher_seed)
{
	int input;

	cout << "Please provide a seed for the encoding cipher." << endl;
	cout << "Enter a whole number between 10 and 99 (inclusive)" << endl;
	cout << "Your number: " << endl;
	cin >> input;
	cipher_seed = input;
	cin.ignore(100, '\n');

	if ((cipher_seed > 9) && (cipher_seed < 100))
	{
		cout << "Thank you for entering your cipher seed: " << cipher_seed << endl;

	} else {
		get_cipher_seed(cipher_seed);
	}
}


//Function to prompt the user for their name
void get_name(char user_name[], int & name_length, char & first_name_char)
{
	char response;
	bool confirmed_name = false;

	while (confirmed_name == false)
	{
		//Instructions to user for entering a valid name
		cout << "You be asked to enter your name (first and last)." << endl;
		cout << "Valid names will only contain upper or lower case letters and a single space between first and last name." << endl;
		cout << "Please enter your first and last name separated by a space (maximum 20 characters).";
		cout << endl << endl;

		cout << "Your name: " << endl;
		cin.get(user_name, MAX, '\n');
		cin.ignore(100, '\n');

		//Get length of user input for looping
		name_length = strlen(user_name);
		first_name_char = user_name[0]; //User for making pseudo-random cipher later

		//Check if user input was valid for a name
		if (valid_name(user_name, name_length))
		{
			cout << "Your entered your name as " << user_name << endl;
			cout << "Confirm and proceed(Y)?" << endl;
			cin >> response;
			cin.ignore(100, '\n');

			if (toupper(response) == 'Y')
			{
				confirmed_name = true;
				//valid and confirmed name should end get_name()
			}

		}  else {
				cout << "Please try again!" << endl;
				cout << "Pay close attention to the parameters for a valid name." << endl;
		}
	}
}


//This function validates an user input for name
bool valid_name(char user_name[], int name_length)
{
	int space_count = 0;

	for (int i = 0; i < name_length; ++i)
	{
		if (user_name[i] == SPACE)
		{
			space_count += 1;
		}

		if (user_name[i] != SPACE && (toupper(user_name[i]) < 65))
		//Checks if each char in name is alphabetical or a space
		{
			return false;
		}

		if (user_name[i] != SPACE && (toupper(user_name[i]) > 90))
		{
			return false;
		}
	}

	if (user_name[0] == SPACE || user_name[(name_length - 1)] == SPACE)
	{
		return false;
	}

	if (space_count == 1)
	{
		return true;
	} else {
		return false;
	}

}


//Get user input for their email address
void get_email(char user_email[], int & email_length)
{
	char response;
	bool confirmed_email = false;

	while (confirmed_email == false)
	{
		//Instructions for entering a valid email address
		cout << "Thank you for entering your name.  You will now be asked to provide your email." << endl;
		cout << "Valid email addresses must contain only one '@' symbol and at least one '.' or dot." << endl;
		cout << "Characters allowed in emails are alphanumeric characters, dashes (-), and underscores (_)." << endl;
		cout << "Please enter your email address now (maximum 20 characters)." << endl << endl;

		cout << "Enter your email: " << endl;
		cin.get(user_email, MAX, '\n');
		cin.ignore(100, '\n');

		//Get length of email
		email_length = strlen(user_email);

		if (valid_email(user_email, email_length))
		{
			cout << "You entered email address: " << user_email << endl;
			cout << "Confirm and proceed(Y)?" << endl;
			cin >> response;
			cin.ignore(100, '\n');

			if (toupper(response) == 'Y')
			{
				confirmed_email = true;
			}

		} else {
			cout << "Please try again!" << endl;
			cout << "Pay close attention to the requirements for a valid email." << endl;
		}
	}
}


//Validate user email input
bool valid_email(char user_email[], int email_length)
{
	int at_count = 0;
	int dot_count = 0;
	int at_index, last_dot_index;

	for (int i = 0; i < email_length; ++i)
	{
		if (user_email[i] == AT_SIGN)
		{
			at_count += 1;
			at_index = i;
		}

		if (user_email[i] == DOT)
		{
			dot_count += 1;
			last_dot_index = i; //Variable will be set to the last index of a dot the loop finds
		}

		if ((user_email[i] != AT_SIGN || user_email[i] != DOT) && (toupper(user_email[i]) < 44))
		{
			return false;
		}

		if ((user_email[i] != AT_SIGN || user_email[i] != DOT) && (toupper(user_email[i]) > 96))
		{
			return false;
		}
	}

	if (last_dot_index < at_index)
	{
		return false; //Return false if there is no '.' after the '@'
	}

	if (at_count == 1 && dot_count > 0) //Email contains only one '@' and at least one '.'
	{
		return true;
	} else {
		return false;
	}
}


