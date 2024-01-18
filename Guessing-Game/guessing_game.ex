defmodule GuessingGame do
  # tell user our guess
  # "yes" -> game over
  # "bigger" -> bigger(low, high)
  # "smaller" -> smaller(low, high)
  # anything else -> tell user to enter a valid responses
  def mid(low, high) do
    div low + high, 2
  end

  def bigger(low, high) do
    new_low = min high, mid(low, high) + 1
    guess(new_low, high)
  end

  def smaller(low, high) do
    new_high = max low, mid(low, high) - 1
    guess(low, new_high)
  end

  def guess(a, b) when a > b, do: guess(b, a) # guard
  end

  def guess(low, high) do
    answer = IO.gets "Hmm... maybe you're thinking of #{mid(low, high)}?\n"
    case String.trim(answer) do
      "bigger" -> bigger(low, high)
      "smaller" -> smaller(low, high)
      "yes" -> "I knew it!"
      _ ->
        IO.puts ~s{Type "bigger", "smaller", or "yes"}
        guess(low, high)
    end
  end
end
