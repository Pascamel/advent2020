namespace day2;

use namespace HH\Lib\{C, Str, Vec};

type Line = shape(
  'min' => int, 
  'max' => int, 
  'character' => string, 
  'password' => string
);

function read_file(string $file_name): vec<Line> {
  $result = vec[];
  $handle = \fopen($file_name, "r");

  if ($handle) {
    $line = \fgets($handle);
    while ($line  !== false) {
      $split1 = Str\split($line, ': ');
      $split2 = Str\split($split1[0], ' ');
      $split3 = Str\split($split2[0], '-');

      $result[] = shape(
        'min' => (int)$split3[0], 
        'max' => (int)$split3[1], 
        'character' => $split2[1], 
        'password' => $split1[1]
      );

      $line = \fgets($handle);
    }
  }
  
  return $result;
}

function is_valid_password_1(Line $line): bool {
  return C\count(Str\split($line['password'], $line['character'])) - 1
    |> $$ >= $line['min'] && $$ <= $line['max'];
}

function is_valid_password_2(Line $line): bool {
  $min_equal = $line['password'][$line['min'] - 1] === $line['character'];
  $max_equal = $line['password'][$line['max'] - 1] === $line['character'];

  return ($min_equal && !$max_equal) || (!$min_equal && $max_equal);
}

function part_one(string $file_name): int {
  $lines = read_file($file_name);

  return Vec\filter($lines, $line ==> is_valid_password_1($line)) 
    |> C\count($$);
}

function part_two(string $file_name): int {
  $lines = read_file($file_name);

  return Vec\filter($lines, $line ==> is_valid_password_2($line))
    |> C\count($$);
}
