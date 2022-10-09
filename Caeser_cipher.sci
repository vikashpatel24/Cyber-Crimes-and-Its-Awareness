// Method name: Modified Caeser cipher

//I have created the script for modified caeser cipher
//It includes both the encrption and the decryption
//Of a custom plain text (Entered by the user)
//With respect to custom key (Entered by the user)
//MODULES COVERED:  1. Modular Arithmetic
//                  2. Cryptographic Techniques 

//MY CONTRIBUTION 
// 1. Both Encryption and Decyrption analysis
// 2. Works for custom plain text
// 3. Works for custom key
// 4. Works for any case (Lower and Upper case)
// 5. Works for numbers also
// 6. All possible decypted text are printed.

//Function for Encryption (param: Plain Text and Key)
function[ct]=encrypt_caesar_general(pt,key)
    a = ascii('A');
    a1 = ascii('0');
    l = length(pt);
    ct = zeros(l);
    
    for i =1:l
        if isletter(part(pt,i:i)) then
            if (ascii(part(pt,i:i))>96) then
                a = ascii('a');
            else
                a = ascii('A');
            end
            ct(i) = a + modulo( ascii(part(pt,i:i))+ key-a, 26 );
        else
            ct(i) = a1 + modulo( ascii(part(pt,i:i))+ key-a1, 10 );
        end
    end
    ct = char(ct);
    ct = strcat(ct);
endfunction 

//Function for Decryption (param: Cipher Text and Key)
function[pt]=decrypt_caesar_general(ct,key)
    a=ascii('A');
    a1=ascii('0');
    l = length(ct);
    pt = zeros(l);
    
    for i =1:l
        if isletter(part(ct,i:i)) then
            if (ascii(part(ct,i:i))>96) then
                a = ascii('a');
            else
                a = ascii('A');
            end
            pt(i) = a + modulo( ascii(part(ct,i:i))+ 26-key-a, 26 );
        else
            if ((ascii(part(ct,i:i))+10-key-a1)>0)
                pt(i) = a1 + modulo( ascii(part(ct,i:i))+ 10-key-a1, 10 );
            else
                pt(i) = a1 + modulo( ascii(part(ct,i:i))+ 20-key-a1, 10 );
            end
        end
    end
    pt = char(pt);
    pt = strcat(pt);
endfunction


//Getting input from User (Uppercase, lowercase and numbers are all supported)
pt = input("Enter the plain text:","string");
key = input("Enter the key for caeser cipher:");

//Encrypting the plain text
ct = encrypt_caesar_general(pt,key);
printf("Cipher Text : %s\n",ct);

//Decrypting the cipher text and printing all possible values
printf("Possible Plaintext using all possible keys:\n\t\n");
printf("Attempt Number\n( Value of k)\n");
for key = 1:25
    printf("\t%d . \t",key);
    printf("%s\n",decrypt_caesar_general(ct,key));
end
