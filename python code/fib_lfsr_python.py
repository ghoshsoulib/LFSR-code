
    
def lfsr_fib(input_string, taps):
    
    count, xor = 0, 0
    n = len(input_string)
    while (count < (pow(2,n)-1)):
        for t in taps:
            xor += int(input_string[t-1])
        if xor%2 == 0.0:
            xor = 0
        else:
            xor = 1
        
        print(input_string, xor, int(input_string,2))

        input_string, xor = str(xor) + input_string[:-1], 0
        count = count +1
 
def lfsr_galois(input_string, taps):
    
    count = 0
    n = len(input_string)
    m = len(taps)
    for j in range(0,m):
        taps[j] = taps[j] - 1
        
    while (count < (pow(2,n)-1)):
        
        input_string_copy = input_string
        print(input_string, int(input_string,2))
        input_string = input_string_copy[n-1] + input_string[:-1]
        input_string_list = list(input_string)
        for i in range(0,m):
            if(taps[i]+1 < n):
                input_string_list[taps[i]+1] = str(int(input_string_copy[taps[i]])^int(input_string_copy[n-1]))      
   
        input_string = ''.join(input_string_list)

        count = count +1

print("Fibonacci LFSR output : \n")
lfsr_fib('1100', (2,3))

print("\n\nGalois LFSR output: ")
lfsr_galois('1100', [2,3])