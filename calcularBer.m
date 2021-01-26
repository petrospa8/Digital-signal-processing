function [BER] = calcularBer(type, M, rangoEbNo, symbolLayout, N)
    
    k = log2(M);
    inBits = rand(1,N*k)>0.5;
    ber = [];
    %obtemos os subvectores cos numeros en binario
    binInBits = reshape(inBits, k, []);
    %convertimos os vectores en numeros decimais
    indexVector = bi2de(binInBits.', 'left-msb');
    if(type == 'QAM')
        symbolVector = qammod(0:M-1, M, symbolLayout);
    else
        symbolVector = pskmod(0:M-1, M, 0, symbolLayout);
    end
    %modulamos o sinal
    modulated = symbolVector(indexVector +1);

    
    
    Eb=mean(abs(modulated.^2))/k;
    

    for i = 1 : length(rangoEbNo)
        N0 = Eb./(10.^(rangoEbNo(i)./10)); %paso a valor natural
        if(isreal(modulated))
            noise= sqrt(N0/2)*randn(size(modulated));
        else
            noise= sqrt(N0/2)*(randn(size(modulated)) + 1j.*randn(size(modulated)));
        end
        noised = noise + modulated;
 
        
        %demodulamos
    repNoised = repmat(noised, M, 1);
	symbolVectorRep = repmat(symbolVector.', 1, length(noised));
	[v, demod] = min(abs(repNoised -symbolVectorRep));
    %calculamos ber
    %sumar erros devidir por bits e plotear con semilogy
    outputSignal = reshape((de2bi(demod.'-1, k, 'left-msb')).', 1, []);


	ber = [ber sum(double(inBits)  ~= outputSignal) / N];
    end
    EbN0 = 10.^rangoEbNo/10;
    Es = EbN0 * log2(M);
    semilogy(rangoEbNo,ber);
    xlabel('EbN0db');
    ylabel('ber');
end 
        
%EbN0db = 0:20 
%EbN0 = 10.^EbN0db/10
%Despues se multiplica por el log2(M) para la Es
%Le aplicamos la erfc para plotear el error teorico , que devuelve la la pe y queremos la pb
 
        
        
            
