main :: IO()
main = do
   let list = [9,3,5,1,2,4,10,8,7,6]

   let sortedList = mergeSort list
   putStrLn ("unsorted: " ++ show list)
   putStrLn ("sorted: " ++ show sortedList)

-- define the merge function
merge :: [Int] -> [Int] -> [Int]
-- merging a empty list with any list will return the list
merge [] xs = xs
merge xs [] = xs

-- piece-wise function in order sort the list
merge (x:xs) (y:ys)
    -- if x<= y then add it to the taill of the first list (xs)
    | x <= y    = x : merge xs (y:ys)
    -- else add y to the result of mergng the entire first list (x:xs)
    | otherwise = y : merge (x:xs) ys
{-
Example:
merge [1,3,5] [2,4,6]
1<2
1 : merge [3,5] [2,4,6]
3 > 2
1: (2: (3 : merge [5] [4,6]))
5 < 6
1 : (2: (3 : (4 : (5 : merge [] [6]))))
-}

-- define the mergeSort function
mergeSort :: [Int] -> [Int]

-- base case empty list
mergeSort [] = []
-- other base case for when a list has one element
mergeSort [x] = [x]

-- mergeSort on xs and recursively call mergeSort
mergeSort xs = merge (mergeSort left) (mergeSort right)
    -- local binding that splits the list in half
    where
        (left, right) = splitAt (length xs `div` 2) xs

