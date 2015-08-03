require 'spec_helper'

describe Primes do
  context 'print' do
    subject{Primes.print(10)}
    it 'a multiplication table for 10 prime numbers' do
      expect {subject}.to output(OUTPUT).to_stdout
    end
  end
end

OUTPUT ="     |    2    3    5    7    11   13   17   19   23   29   \n-----+­---------------------------------------------------\n2    |    4    6    10   14   22   26   34   38   46   58   \n3    |    6    9    15   21   33   39   51   57   69   87   \n5    |    10   15   25   35   55   65   85   95   115  145  \n7    |    14   21   35   49   77   91   119  133  161  203  \n11   |    22   33   55   77   121  143  187  209  253  319  \n13   |    26   39   65   91   143  169  221  247  299  377  \n17   |    34   51   85   119  187  221  289  323  391  493  \n19   |    38   57   95   133  209  247  323  361  437  551  \n23   |    46   69   115  161  253  299  391  437  529  667  \n29   |    58   87   145  203  319  377  493  551  667  841  \n"
