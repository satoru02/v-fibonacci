#再帰関数
#メモ
#スタック
#メモリ

#フィボナッチ数を求める公式
#Fn = 0 (n = 0)
#Fn = 1 (n = 1)
#Fm = Fm-1 + Fm-2(m = 2,3...)

class Fibonacci
  def initialize
    @a = 0; @b = 1; @memo = [];
  end

  # A: Recursive pattern
  # 再帰関数を呼び出す過程では、重複した計算が行われる。
  # そのため一度計算した結果を再利用するため、Fibonacciクラスのクラス変数である@memoに計算結果を保存しておく。
  # ||= で 再帰関数の@memoの中身を確認し、計算結果がない（まだ計算していない）のであれば、フィボナッチ公式に従って結果を求める。
  def get_number_by_recursive(n)
    return n if n == @a || n == @b
    @memo[n] ||= get_number_by_recursive(n-1) + get_number_by_recursive(n-2);
    return @memo[n]
  end

  # B: Loop pattern
  # ループ処理でフィボナッチ数を求める。
  def get_number_by_loop(n)
    n.times { @a , @b = @b , @a + @b }
    return @a
  end
end

fib = Fibonacci.new
pattern = ARGV[1].to_s
fib_number = ARGV[0].to_i

begin
  if pattern === "recursive"
    p fib.get_number_by_recursive(fib_number)
  elsif pattern === "loop"
    p fib.get_number_by_loop(fib_number)
  else
    raise StandardError, "再帰関数を求めるためのパターンを選択してください。（Ex）recursive"
  end
rescue => e
  p e.message
end


