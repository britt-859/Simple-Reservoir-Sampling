import Random

#Process stdin
function main()
    # Create an array to hold the number in each line seq
    num = []  
    if isempty(ARGS)
        sampleSize = 100  #default sample size
    else
        sampleSize = parse(Int, ARGS[1])
    end

    i = 1 #index of elements 
    for line in eachline()
        if i > sampleSize  
            num = reservoirSampling(num, line, i, sampleSize)
            i = i + 1
        else
            push!(num, line)  #add each number to the end of the array
            i = i + 1
        end                
    end

    num = Random.shuffle(num)
    display(num)     
end

function display(result)
    for i in result
        println(i)
    end
end

#simple reservoir sampling
function reservoirSampling(num, n, i, sampleSize)
    j = rand(1:i)  #get random number between 1 to index
    if j <= sampleSize
        num[j] = n
    end
    return num
end


if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
