(1..100).detect  => #<Enumerator: 1..100:detect>
(1..100).find    => #<Enumerator: 1..100:find>

(1..10).detect   { |i| i % 5 == 0 and i % 7 == 0 }   #=> nil
(1..10).find     { |i| i % 5 == 0 and i % 7 == 0 }   #=> nil
(1..100).detect  { |i| i % 5 == 0 and i % 7 == 0 }   #=> 35
(1..100).find    { |i| i % 5 == 0 and i % 7 == 0 }   #=> 35