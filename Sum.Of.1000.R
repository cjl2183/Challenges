# Q. What is the sum of all numbers below 1000 that are divisible by 3 and 5?
# Assumption. Assume that the range of possible numbers does not include negative numbers
# Assumption. Thus the range is 0-999

#Initialize values
num1=3;
num2=5;
max=1000;
max.multiple=num1*num2;
multiplier=floor((max-1)/max.multiple);
sum=0;
count=0;
sum.2=0;
base=mat.or.vec(15,3);

# Create a 15x3 matrix containing info about numbers 1-15 and their divisibiity by 3 and 5
for(i in 1:(num1*num2)){
  base[i,1]=i;
  if(i %% num1==0 | i %% num2==0){
    base[i,2]=i;
    base[i,3]=1;
  }
}

# Add up the all the multiples of 15 below 1000
total=colSums(base);
triangle.num=((multiplier-1)^2+(multiplier-1))/2;
sum=total[2]*multiplier+max.multiple*total[3]*triangle.num;

# Add up the remaining numbers truncated by full multiples
total.rem=max-multiplier*max.multiple-1;
total.diff=colSums(base[1:total.rem,]);
sum=sum+total.diff[2]+max.multiple*multiplier*total.diff[3];

print(sum);
