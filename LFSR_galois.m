function[finalval]=LFSR_galois(input_string,primitive_pol)
n=length(input_string);
c(1,:)=input_string;
bin_val = [];
bin_val = [bin_val bin2dec(num2str(input_string))];
m=length(primitive_pol);
for k=1:2^n-2
    input_string_copy = input_string;
    j=1:n-1;
    input_string(n+1-j)=input_string(n-j); %right shift of the string
    input_string(1) = input_string_copy(n);
    %update the positions based on the index in primite polynomial
    for i = 1:m
 
        if(primitive_pol(i)+1 <= n)
            input_string(primitive_pol(i)+1) = xor(input_string_copy(primitive_pol(i)), input_string_copy(n));
        end
        
    end
    
    c(k+1,:)=input_string; % create the sequence of numbers
    bin_val = [bin_val bin2dec(num2str(input_string))]; % create the sequence of number for verification
    
end

finalval = [c bin_val'];
 
end

