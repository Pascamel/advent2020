use namespace HH\Lib\{C, Str, Vec};

type Line = shape(
  'min' => int, 
  'max' => int, 
  'character' => string, 
  'password' => string
);

class Day2 extends DayBase {
  private vec<Line> $lines2 = vec[];

  public function __construct(string $file_name) {
    parent::load_file($file_name);
    $this->lines2 = Vec\map($this->lines, $line ==> {
      $split1 = Str\split($line, ': ');
      $split2 = Str\split($split1[0], ' ');
      $split3 = Str\split($split2[0], '-');

      return shape(
        'min' => (int)$split3[0], 
        'max' => (int)$split3[1], 
        'character' => $split2[1], 
        'password' => $split1[1]
      );
    });
  }

  private static function is_valid_password_1(Line $line): bool {
    return C\count(Str\split($line['password'], $line['character'])) - 1
      |> $$ >= $line['min'] && $$ <= $line['max'];
  }

  private static function is_valid_password_2(Line $line): bool {
    $min_equal = $line['password'][$line['min'] - 1] === $line['character'];
    $max_equal = $line['password'][$line['max'] - 1] === $line['character'];

    return ($min_equal && !$max_equal) || (!$min_equal && $max_equal);
  }

  private function part_one(): int {
    return Vec\filter($this->lines2, $line ==> self::is_valid_password_1($line)) 
      |> C\count($$);
  }

  private function part_two(): int {
    return Vec\filter($this->lines2, $line ==> self::is_valid_password_2($line))
      |> C\count($$);
  }

  public static function solve(string $sample_file, string $input_file): string {
    $sample = new Day2($sample_file);
    $input = new Day2($input_file);

    return Str\join(vec[
      Str\format("part 1 : %d - %d", $sample->part_one(), $input->part_one()),
      \PHP_EOL,
      Str\format("part 2 : %d - %d", $sample->part_two(), $input->part_two()),
      \PHP_EOL,
    ], '');
  }
}
