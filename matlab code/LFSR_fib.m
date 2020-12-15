function[finalval]=LFSR_fib(input_string,primitive_pol)
n=length(input_string);
c(1,:)=input_string;
xor_seq = [];
bin_val = [];
bin_val = [bin_val bin2dec(num2str(input_string))];
m=length(primitive_pol);
for k=1:2^n-2
    b(1)=xor(input_string(primitive_pol(1)), input_string(primitive_pol(2)));
    if m>2
        for i=1:m-2
            b(i+1)=xor(input_string(primitive_pol(i+2)), b(i));
        end
    end
    j=1:n-1;
    input_string(n+1-j)=input_string(n-j); %right shift of the string
    input_string(1)=b(m-1); %bring the xor output to the first of the string
    xor_seq = [xor_seq b(m-1)]; % create the xor sequence
    c(k+1,:)=input_string; % create the sequence of numbers
    bin_val = [bin_val bin2dec(num2str(input_string))]; % create the sequence of number for verification
end

b(1)=xor(input_string(primitive_pol(1)), input_string(primitive_pol(2)));
if m>2
    for i=1:m-2
        b(i+1)=xor(input_string(primitive_pol(i+2)), b(i));
    end
end
xor_seq = [xor_seq b(m-1)]; % update the xor value for the last string
finalval = [c xor_seq' bin_val'];
 
end

