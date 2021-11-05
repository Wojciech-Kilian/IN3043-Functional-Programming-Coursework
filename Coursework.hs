module Coursework where

import Animation

test :: IO () 
test = writeFile "test.svg" (svg 1600 1200 whirl)

--animation itself
whirl :: Animation
whirl = translate(always(250,250))(combine[shadow(i)`plus`(rotate(spinner  (i^2))(p(i)))|i <- [1..8]])

-- black circles
p :: Double -> Animation
p i = combine([translate(always((22*i*a),0))(circle(always 10))| a <- [-1,1]])

--grey roads
shadow :: Double -> Animation
shadow i = withoutPaint(withGenBorder(always gray)(cycleSmooth (i^2) [0,1])(always 2)(circle(always (i*22))))

--Least Common Multiple of 1,4,9,16,25,36,49,64 = 705600~ Animation repeats once in roughly 8 days