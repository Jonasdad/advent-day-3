#Advent of Code 2022 Challenge - Day 3
#Course: ID1019 @KTH
#Author: Jonas Dåderman

defmodule Advent do
  def main() do
    map = %{a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: 7, h: 8, i: 9, j: 10, k: 11, l: 12, m: 13, n: 14, o: 15,
    p: 16, q: 17, r: 18, s: 19 , t: 20, u: 21, v: 22, w: 23, x: 24, y: 25, z: 26, A: 27, B: 28, C: 29,
    D: 30, E: 31, F: 32, G: 33, H: 34, I: 35, J: 36, K: 37, L: 38, M: 39, N: 40, O: 41, P: 42, Q: 43,
    R: 44, S: 45, T: 46, U: 47, V: 48, W: 49, X: 50, Y: 51, Z: 52}
    inputString = "ABCDEFGHIJKLMOPQRSTUVWK"

      list = String.codepoints(inputString)
      a = first_half(list, get_middle(list), 0)
      b = second_half(list, get_middle(list), 0)
      priority = Map.fetch(map, String.to_atom(find_common(a,b)))
      elem(priority, 1)
      sumPrio([1,2,3,4,5,6,7,8,9])
    end

    def sumPrio([h | t]) do
      h + sumPrio(t)
    end
    def sumPrio([]) do 0 end

    #Finds middle point in list.
    def get_middle(list) do trunc(Kernel.length(list) / 2) end
    #Iterates through orignial and returns first half of list (very poor performance for large lists)
    def first_half([h|t], half, counter) do
      if(half > counter) do
        counter = counter+1;
        [h | first_half(t, half, counter)]
      else
        first_half([], half, counter)
      end
    end
    def first_half([], _half, _counter) do [] end

    #Iterates through original and returns second half of list (very poor performance for large lists)
    def second_half([h|t], half, counter) do
      counter = counter + 1
      if(half < counter) do
        [h | second_half(t, half, counter)]
      else
        second_half(t, half, counter)
      end
    end
    def second_half([], _half, _counter) do [] end

    #Find shared letter
    def find_common(h1, [h1 | _t2]) do #Match function
       h1
    end
    def find_common([h1 | t1], listB) do #Iterate function with first element from list a
    case find_common(h1, listB) do #If first char fails -> go next char in list a
       :error ->
        find_common(t1, listB)
        h1 -> h1
    end
    end
    def find_common(h1, [_h2 | t2]) do #iterate through list B
      find_common(h1, t2)
    end
    def find_common([], _h1) do :error end #search failed
    def find_common(_h1, []) do :error end #search failed
end
