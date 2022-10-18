class Array

    def my_each(&prc)
        i = 0
        while i < self.length
            ele = self[i]
            prc.call(ele)

            i += 1
        end

        self 
    end


    def my_select(&prc)
        result = []

        i = 0 
        while i < self.length
            ele = self[i]
            if prc.call(ele)
                result << ele
            end

            i += 1
        end

        result 
    end

    def my_reject(&prc)
        result = []

        i = 0 
        while i < self.length
            ele = self[i]
            if !prc.call(ele)
                result << ele
            end

            i += 1
        end

        result 
    end


    def my_any?(&prc)
        self.each do |num|
            if prc.call(num)
                return true 
            end
        end

        return false 
    end

    def my_all?(&prc)
        self.each do |num|
            if !prc.call(num)
                return false
            end
        end

        return true
    end

    def my_flatten
        flat = []

        self.each do |ele|
            if ele.is_a?(Array)
                flat.concat(ele.my_flatten)
            else
                flat << ele 
            end
        end

        flat
    end

    def my_zip(*arrays) 
        result = []

        (0...self.length).each do |i| # [1, 2, 3]
            arr = [self[i]] # [1]
    
            arrays.each do |array| # a = [ 4, 5, 6 ]  b = [ 7, 8, 9 ]
                arr << array[i] # [1] << 4   << 7
            end

            result << arr
        end

        result 
    end


    def my_rotate(num = 1) #["b", "c", "d", "a"]
        if num > 0
            num.times do |i|
                ele = self.shift 
                self.push(ele)
            end
        elsif num < 0 
            num.times do |i|
                ele = self.pop
                self.unshift(ele)
            end
        end
    end


    def my_join(sep = "")
        str = ""

        (0...self.length).each do |i|
            if i == self.length - 1
                str += self[i]
            else
                str += self[i] + sep
            end
        end

        str 
    end


    def my_reverse
        reverse = []

        i = self.length - 1
        while i >= 0
            reverse << self[i]

            i -= 1
        end
        
        reverse 
    end





end