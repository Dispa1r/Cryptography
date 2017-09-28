︠ca1ba366-5db1-4cc8-9630-b9568e5def45s︠
S1=[[1,0,1],[0,1,0],[0,0,1],[1,1,0],[0,1,1],[1,0,0],[1,1,1],[0,0,0],
    [0,0,1],[1,0,0],[1,1,0],[0,1,0],[0,0,0],[1,1,1],[1,0,1],[0,1,1]]
S2=[[1,0,0],[0,0,0],[1,1,0],[1,0,1],[1,1,1],[0,0,1],[0,1,1],[0,1,0],
    [1,0,1],[0,1,1],[0,0,0],[1,1,1],[1,1,0],[0,1,0],[0,0,1],[1,0,0]]
︡4322a4e7-10bc-41d3-8c98-ff830a32e17d︡{"done":true}︡
︠cff15800-d399-4af2-8e24-8f787df30e26s︠
def bin2int(L): #convert binary list to integer
    sum=0
    l=len(L)-1
    for i in [0..l]:
        if L[i]==1:
            sum+=2^(l-i)
    return sum

def int2bin(i,l): #convert integer to binary list of length l
    L=[]
    for j in [1..l]:
        if i%2==1:
            L.append(1)
            i-=1
        else:
            L.append(0)
        i/=2
    L.reverse()
    return L

def Bin(S):  #Converts a number written using 1s and 0s into its binary list representation
    L=[]
    for i in [1..ceil(log(S,10))]:
        d=S%10
        S-=d
        S/=10
        L.append(d)
    L.reverse()
    return L
︡bc43e62f-6fb8-4e37-b633-31ebc21af9ee︡{"done":true}︡
︠9d471dcb-6063-4786-9e15-5169aeb61eefs︠
Bin(1010)
︡72395b47-6aa1-47a1-a34c-d01793456287︡{"stdout":"[1, 0, 1, 0]\n"}︡{"done":true}︡
︠2fb02f30-2a3a-4e2c-9adc-9d2dbd98beeds︠
int2bin(20,8)
︡710fb4a0-471c-4f8f-b61e-369bb0e9b5ff︡{"stdout":"[0, 0, 0, 1, 0, 1, 0, 0]\n"}︡{"done":true}︡
︠e50c1532-7994-48db-9cae-2cf1333f509as︠
bin2int([1,0,1,0])
︡39b7138a-0b0c-45ad-8624-4cfabcc8b1f6︡{"stdout":"10\n"}︡{"done":true}︡
︠635da808-4216-48c9-aeda-d64223192b02s︠
def Expander(L): #Expands a string from 6 bits to 8 bits for SDES
    if not len(L)==6:
        print "Wrong length"
        return 0
    R = [L[0],L[1],L[3],L[2],L[3],L[2],L[4],L[5]]
    return R

def split(M):  #Splits the list M into two equal halves, used several times in SDES algorithm
    if len(M)%2==1:
        print "Wrong Message Length"
    return (M[0:len(M)/2],M[len(M)/2:len(M)])

def xor(L,M):  #performs a binary xor (addition) of the two strings L,M
    if not len(L)==len(M):
        print "Strings have different lengths"
        return 0
    return [sum(a)%2 for a in zip(L,M)]

def roundkey(K,i): #Return the 8 bit key for round i from the master 9-bit key
    if i==1 or i==2:
        return K[i-1:i+7]
    else:
        return K[i-1:10]+K[0:i-2]
︡9e72d212-9ad7-4804-b30a-af31398d725f︡{"done":true}︡
︠37401d57-97bc-4f03-8bb4-28a38249b2b0s︠
Bin(100111)
︡8ac1159c-c87e-445e-b835-d3ac4449d444︡{"stdout":"[1, 0, 0, 1, 1, 1]\n"}︡{"done":true}︡
︠cb423945-b70d-4558-a3f9-83d93dbe9b5ds︠
Expander(Bin(100111))
︡821257bf-e263-40b2-a77b-52d006c3165c︡{"stdout":"[1, 0, 1, 0, 1, 0, 1, 1]\n"}︡{"done":true}︡
︠b561988b-6bd8-44c7-8c81-c8599a18d3ads︠
xor([0,0,1],[0,1,1])
︡fb52a7cf-bb98-4260-81fc-44180b6710fe︡{"stdout":"[0, 1, 0]\n"}︡{"done":true}︡
︠df5a7e8a-cf54-480c-a234-48e23fec14c0s︠
S1[bin2int([0,1,1,1])]

︡a29a0add-753c-4ab0-9eaa-8e9727f1df16︡{"stdout":"[0, 0, 0]\n"}︡{"done":true}︡
︠9ea2e49a-6a3d-4dc8-a33c-409d8b9713d5s︠
roundkey([1,0,1,1,0,1,1,0,0],3)
︡0e18203f-0f0f-4337-ae12-b0af10a7c759︡{"stdout":"[1, 1, 0, 1, 1, 0, 0, 1]\n"}︡{"done":true}︡
︠847ca93d-b6b6-4a1d-9be4-781a3a0dfb26s︠
S1[bin2int([0,1,1,1])]
︡6a9ec2e6-36b6-4497-aa90-53275a3818e5︡{"stdout":"[0, 0, 0]\n"}︡{"done":true}︡
︠7d667a55-9d3c-420f-bfb9-8a75d0d913c2s︠
split([0,1,0,0,1,1,1,0])
︡dcca5994-36f5-4c12-80b4-2cb6aba0e4ab︡{"stdout":"([0, 1, 0, 0], [1, 1, 1, 0])\n"}︡{"done":true}︡
︠79427fa6-ea8e-46e1-b4ed-0b8f337cb8c4s︠
[1,1,1]+[0,0,0]
︡17b6dd7e-4c29-4660-9a77-662627569e65︡{"stdout":"[1, 1, 1, 0, 0, 0]\n"}︡{"done":true}︡
︠13615ac1-6aa9-405b-ac40-feba22e801bds︠
︡e76acfda-938a-46d5-bfcf-f7b15c964ad3︡{"done":true}︡
︠71016369-c847-420c-80e2-b6ede7703c74s︠
def SDESf(R,Ki): #Performs the function f that is used in the encryption of SDES
    E=Expander(R)
    Temp=xor(E,Ki)
    (lhalf,rhalf)=split(Temp)
    return S1[bin2int(lhalf)]+S2[bin2int(rhalf)]

def SDESround(M,Kr):  #Performs one round of SDES using the roundkey Kr
    (L1,R1)=split(M)
    L2=R1
    R2 = xor(SDESf(R1,Kr),L1)
    return L2+R2

def SDES(M,K,r):  #Performs SDES on M with the key K using r rounds.
    for i in [1..r]:
        rkey=roundkey(K,i)
        M=SDESround(M,rkey)
        #print "Round:",i,M
    return M

︡2e769b91-40db-459d-aa47-fe9285ac150b︡{"done":true}︡
︠f6c80ca5-4a43-4b80-b534-6c64c294d422s︠
SDES(Bin(101101110101),Bin(111010110),3)
︡73a2e160-f55f-4c18-8665-89c21937f965︡{"stdout":"[0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 1, 1]\n"}︡{"done":true}︡
︠1347f8cb-ceb2-410e-bea1-73a5a4c2c222s︠

︡543e2e5f-4ed9-4d62-8a47-ba1fc8202022︡{"done":true}︡
︠af2797d1-3b55-46d5-85ee-63ba142f6c6es︠
def randomKey():
   K = []
   for i in [1..9]:
        K.append(floor(random()*2))
   return K
︡ea72aa73-f193-45ef-b7fe-d0aafd73eec4︡{"done":true}︡
︠56f67c21-7f62-4b40-88c1-29c087d26cfds︠
randomKey()
︡d7bf19fd-2628-4d6a-aa57-4edcb43500a5︡{"stdout":"[0, 0, 1, 1, 0, 1, 0, 0, 1]\n"}︡{"done":true}︡
︠da63a6bd-9ba1-4935-9a8e-37e4f3acfff9s︠
def SearchOverPairs(L,S):
    for i in [0..15]:
        print int2bin(i,4), "Corresponding pair:", xor(L,int2bin(i,4)), "Sbox Outputs:", S[i],"⊕",S[bin2int(xor(L,int2bin(i,4)))],'=', xor(S[i],S[bin2int(xor(L,int2bin(i,4)))])
︡a8372ced-5717-4c47-ae6e-f5d6ada944d1︡{"done":true}︡
︠eabdb2ed-a787-4708-9a0a-373fee5bfbe5s︠
#Start here!
︡afb70d93-42e9-454b-b644-3fd05ecc986f︡{"done":true}︡
︠454872db-6f7e-4c86-811c-09a2433233f6s︠
K=randomKey()
︡933b366c-a273-41c2-a95b-31bbf05e5ca1︡{"done":true}︡
︠41f8cc10-a685-45d9-9849-7b2b3e49a48ds︠
P=[0,0,0,0,1,1,1,1,1,0,1,1]
︡03fe8b67-47e9-44cc-b724-fd66d69cd816︡{"done":true}︡
︠2272e1fc-0caf-498a-a8df-018bae780da1s︠
out=SDES(P,K,3)
out
︡b7450f77-024a-4139-8bc0-df6d4050f330︡{"stdout":"[1, 0, 1, 0, 0, 0, 1, 0, 1, 1, 1, 1]\n"}︡{"done":true}︡
︠6474b2d7-a79e-4813-8ea6-c32bc2ffe655s︠
(L0,R0)=split(P)
(L0,R0)

︡9673e3a0-104f-4afb-bd74-f213cc8950ab︡{"stdout":"([0, 0, 0, 0, 1, 1], [1, 1, 1, 0, 1, 1])\n"}︡{"done":true}︡
︠44c52f37-87f6-4967-8f2e-f8d615945831s︠
(L3,R3)=split(out)
(L3,R3)
︡1b4cbc07-e306-4522-8ee2-9093ceb79990︡{"stdout":"([1, 0, 1, 0, 0, 0], [1, 0, 1, 1, 1, 1])\n"}︡{"done":true}︡
︠e82ce1df-331d-414c-ad91-bae0f8a88653s︠
Ps = [0,1,0,1,1,1,1,1,1,0,1,1] #Change the first 6 bits of this to try additional times!
︡b9b99184-1cc4-40c8-8136-d89c503fedff︡{"done":true}︡
︠222123fc-910d-4517-a451-84c867f953c3s︠
outs=SDES(Ps,K,3)
outs
︡375aae37-40c3-48ae-a239-48c6c502d875︡{"stdout":"[1, 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 0]\n"}︡{"done":true}︡
︠5a80a5f3-4442-4268-b867-dcec1121e0c5s︠
(L0s,R0s)=split(Ps)
(L0s,R0s)
︡d7283ef5-fafc-4842-81e4-de7f8cb94591︡{"stdout":"([0, 1, 0, 1, 1, 1], [1, 1, 1, 0, 1, 1])\n"}︡{"done":true}︡
︠850bee16-577f-41e3-a201-4f80903b2bf3s︠
(L3s,R3s)=split(outs)
(L3s,R3s)
︡a533181a-dd8a-4930-bc74-b3a9ddb42163︡{"stdout":"([1, 1, 1, 0, 1, 0], [1, 1, 0, 0, 0, 0])\n"}︡{"done":true}︡
︠2866e8de-df7c-4d80-9c49-086bb4a5d02cs︠
xor(Expander(L3),Expander(L3s))
︡30acde01-4ed1-49ef-bc04-99088b8ee31a︡{"stdout":"[0, 1, 0, 0, 0, 0, 1, 0]\n"}︡{"done":true}︡
︠58ee158c-ab90-46c7-a6e6-f93bbb61c9f5s︠
xor(xor(R3,R3s),xor(L0,L0s))
︡19192355-83be-48af-ab34-72a259bf7b84︡{"stdout":"[0, 0, 1, 0, 1, 1]\n"}︡{"done":true}︡
︠973d5861-c78f-4ee5-ab2a-f290ba4e6c4fs︠

︡b79151d0-66d8-471d-a835-efbf9443c8d5︡{"done":true}︡
︠0a49354e-f8bc-46b7-bb2a-953990fac6f1s︠
SearchOverPairs([1,0,0,0],S1)  #use the first 4 bits of "xor(Expander(L3),Expander(L3s))" and look for first 3 bits of "xor(xor(R3,R3s),xor(L0,L0s))"
︡ff1b9cdd-7009-4c23-9e17-14d6ae141d95︡{"stdout":"[0, 0, 0, 0] Corresponding pair: [1, 0, 0, 0] Sbox Outputs: [1, 0, 1] ⊕ [0, 0, 1] = [1, 0, 0]\n[0, 0, 0, 1] Corresponding pair: [1, 0, 0, 1] Sbox Outputs: [0, 1, 0] ⊕ [1, 0, 0] = [1, 1, 0]\n[0, 0, 1, 0] Corresponding pair: [1, 0, 1, 0] Sbox Outputs: [0, 0, 1] ⊕ [1, 1, 0] = [1, 1, 1]\n[0, 0, 1, 1] Corresponding pair: [1, 0, 1, 1] Sbox Outputs: [1, 1, 0] ⊕ [0, 1, 0] = [1, 0, 0]\n[0, 1, 0, 0] Corresponding pair: [1, 1, 0, 0] Sbox Outputs: [0, 1, 1] ⊕ [0, 0, 0] = [0, 1, 1]\n[0, 1, 0, 1] Corresponding pair: [1, 1, 0, 1] Sbox Outputs: [1, 0, 0] ⊕ [1, 1, 1] = [0, 1, 1]\n[0, 1, 1, 0] Corresponding pair: [1, 1, 1, 0] Sbox Outputs: [1, 1, 1] ⊕ [1, 0, 1] = [0, 1, 0]\n[0, 1, 1, 1] Corresponding pair: [1, 1, 1, 1] Sbox Outputs: [0, 0, 0] ⊕ [0, 1, 1] = [0, 1, 1]\n[1, 0, 0, 0] Corresponding pair: [0, 0, 0, 0] Sbox Outputs: [0, 0, 1] ⊕ [1, 0, 1] = [1, 0, 0]\n[1, 0, 0, 1] Corresponding pair: [0, 0, 0, 1] Sbox Outputs: [1, 0, 0] ⊕ [0, 1, 0] = [1, 1, 0]\n[1, 0, 1, 0] Corresponding pair: [0, 0, 1, 0] Sbox Outputs: [1, 1, 0] ⊕ [0, 0, 1] = [1, 1, 1]\n[1, 0, 1, 1] Corresponding pair: [0, 0, 1, 1] Sbox Outputs: [0, 1, 0] ⊕ [1, 1, 0] = [1, 0, 0]\n[1, 1, 0, 0] Corresponding pair: [0, 1, 0, 0] Sbox Outputs: [0, 0, 0] ⊕ [0, 1, 1] = [0, 1, 1]\n[1, 1, 0, 1] Corresponding pair: [0, 1, 0, 1] Sbox Outputs: [1, 1, 1] ⊕ [1, 0, 0] = [0, 1, 1]\n[1, 1, 1, 0] Corresponding pair: [0, 1, 1, 0] Sbox Outputs: [1, 0, 1] ⊕ [1, 1, 1] = [0, 1, 0]\n[1, 1, 1, 1] Corresponding pair: [0, 1, 1, 1] Sbox Outputs: [0, 1, 1] ⊕ [0, 0, 0] = [0, 1, 1]\n"}︡{"done":true}︡
︠0db5f3cb-c542-40e8-a069-806245d37372s︠
︡8d0f48aa-169e-4ee3-a1d4-370d91c3deda︡{"done":true}︡
︠75df1409-a229-4333-81b3-29f68a1ac8e9s︠
SearchOverPairs([0,0,1,1],S2)   #use the last 4 bits of "xor(Expander(L3),Expander(L3s))" and look for last 3 bits of "xor(xor(R3,R3s),xor(L0,L0s))"
︡15b16a0f-d50b-4ae5-aa0c-e2b6789427f1︡{"stdout":"[0, 0, 0, 0] Corresponding pair: [0, 0, 1, 1] Sbox Outputs: [1, 0, 0] ⊕ [1, 0, 1] = [0, 0, 1]\n[0, 0, 0, 1] Corresponding pair: [0, 0, 1, 0] Sbox Outputs: [0, 0, 0] ⊕ [1, 1, 0] = [1, 1, 0]\n[0, 0, 1, 0] Corresponding pair: [0, 0, 0, 1] Sbox Outputs: [1, 1, 0] ⊕ [0, 0, 0] = [1, 1, 0]\n[0, 0, 1, 1] Corresponding pair: [0, 0, 0, 0] Sbox Outputs: [1, 0, 1] ⊕ [1, 0, 0] = [0, 0, 1]\n[0, 1, 0, 0] Corresponding pair: [0, 1, 1, 1] Sbox Outputs: [1, 1, 1] ⊕ [0, 1, 0] = [1, 0, 1]\n[0, 1, 0, 1] Corresponding pair: [0, 1, 1, 0] Sbox Outputs: [0, 0, 1] ⊕ [0, 1, 1] = [0, 1, 0]\n[0, 1, 1, 0] Corresponding pair: [0, 1, 0, 1] Sbox Outputs: [0, 1, 1] ⊕ [0, 0, 1] = [0, 1, 0]\n[0, 1, 1, 1] Corresponding pair: [0, 1, 0, 0] Sbox Outputs: [0, 1, 0] ⊕ [1, 1, 1] = [1, 0, 1]\n[1, 0, 0, 0] Corresponding pair: [1, 0, 1, 1] Sbox Outputs: [1, 0, 1] ⊕ [1, 1, 1] = [0, 1, 0]\n[1, 0, 0, 1] Corresponding pair: [1, 0, 1, 0] Sbox Outputs: [0, 1, 1] ⊕ [0, 0, 0] = [0, 1, 1]\n[1, 0, 1, 0] Corresponding pair: [1, 0, 0, 1] Sbox Outputs: [0, 0, 0] ⊕ [0, 1, 1] = [0, 1, 1]\n[1, 0, 1, 1] Corresponding pair: [1, 0, 0, 0] Sbox Outputs: [1, 1, 1] ⊕ [1, 0, 1] = [0, 1, 0]\n[1, 1, 0, 0] Corresponding pair: [1, 1, 1, 1] Sbox Outputs: [1, 1, 0] ⊕ [1, 0, 0] = [0, 1, 0]\n[1, 1, 0, 1] Corresponding pair: [1, 1, 1, 0] Sbox Outputs: [0, 1, 0] ⊕ [0, 0, 1] = [0, 1, 1]\n[1, 1, 1, 0] Corresponding pair: [1, 1, 0, 1] Sbox Outputs: [0, 0, 1] ⊕ [0, 1, 0] = [0, 1, 1]\n[1, 1, 1, 1] Corresponding pair: [1, 1, 0, 0] Sbox Outputs: [1, 0, 0] ⊕ [1, 1, 0] = [0, 1, 0]\n"}︡{"done":true}︡
︠4745c334-28ba-4075-a5be-a73210ed278as︠
xor(Expander(L3),[0,1,1,1,0,1,0,0])
︡3546de90-6d5a-45f4-804b-81a7a93c6dde︡{"stdout":"[1, 1, 0, 1, 1, 1, 1, 1]\n"}︡{"done":true}︡
︠373f0868-778d-4c61-a1c7-c355bd531978s︠



K
︡ccdea6ef-dcb4-4a81-9ac9-5138862d17ef︡{"stdout":"[1, 1, 0, 0, 1, 0, 1, 1, 0]\n"}︡{"done":true}︡
︠a9ab7c23-ea31-4483-b324-1e9921f450f1s︠
︡e9179a90-1976-4e06-933d-5efd16d46a46︡{"done":true}︡









