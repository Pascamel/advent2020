use namespace HH\Lib\Str;

class Day1 {
  private vec<int> $numbers = vec[];

  public function __construct(string $file_name) {
    $handle = \fopen($file_name, "r");
  
    if ($handle) {
      $line = \fgets($handle);
      while ($line !== false) {
        $this->numbers[] = \intval($line);
        $line = \fgets($handle);
      }
    }
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

    $lines = vec[
      Str\format("part 1 : %d - %d", $sample->part_one(), $input->part_one()),
      \PHP_EOL,
      Str\format("part 2 : %d - %d", $sample->part_two(), $input->part_two()),
      \PHP_EOL,
    ];

    return Str\join($lines, '');
  }
}
