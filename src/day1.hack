use namespace HH\Lib\{Vec,Str};

class Day1 extends DayBase {
  private vec<int> $numbers = vec[];

  public function __construct(string $file_name) {
    parent::load_file($file_name);
    $this->numbers = Vec\map($this->lines, $v ==> intval($v));
  } 

  private function part_one(): int {
    $numbers_set = Set {};
    $result = -1;

    foreach ($this->numbers as $number) {
      if ($numbers_set->contains(2020 - $number)) {
        $result = $number * (2020 - $number);
        break;
      } else {
        $numbers_set->add($number);
      }    
    }

    return $result;
  }

  private function part_two(): int {
    
    $numbers_set = new Set($this->numbers);
    $result = -1;

    foreach($this->numbers as $k1 => $v1) {
      foreach($this->numbers as $k2 => $v2) {
        if ($numbers_set->contains(2020 - $v1 - $v2)) {
          $result = $v1 * $v2 * (2020 - $v1 - $v2);
          break;
        }
      }
    }

    return $result;
  }

  public static function solve(string $sample_file, string $input_file): string {
    $sample = new Day1($sample_file);
    $input = new Day1($input_file);

    return Str\join(vec[
      Str\format("part 1 : %d - %d", $sample->part_one(), $input->part_one()),
      \PHP_EOL,
      Str\format("part 2 : %d - %d", $sample->part_two(), $input->part_two()),
      \PHP_EOL,
    ], '');
  }
}
