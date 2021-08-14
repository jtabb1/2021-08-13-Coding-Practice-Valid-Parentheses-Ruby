# @param {String} s
# @return {Boolean}
def is_valid(s)
  hash = {}
  score_a = 0 # ()
  score_b = 0 # []
  score_c = 0 # {}

  stack = ""

  s.split("").each do |et|
    if et == "(" || et == ")"
      if et == "("
        score_a += 1
        stack = stack + "("
      else
        return false if stack[stack.size-1] != "("
        stack[stack.size-1] = ""
        score_a -= 1
      end
      return false if score_a < 0
    elsif et == "[" || et == "]"
      if et == "["
        score_b += 1
        stack = stack + "["
      else
        return false if stack[stack.size-1] != "["
        stack[stack.size-1] = ""
        score_b -= 1
      end
      return false if score_b < 0
    elsif et == "{" || et == "}"
      if et == "{"
        score_c += 1
        stack = stack + "{"
      else
        return false if stack[stack.size-1] != "{"
        stack[stack.size-1] = ""
        score_c -= 1
      end
      return false if score_c < 0
    else
      return false
    end
  end
  if (score_a == 0 && score_b == 0 && score_c == 0)
    return true
  end
  false
end