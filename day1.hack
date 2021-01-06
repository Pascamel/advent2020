function read_file($file_name): vec<int> {
  $handle = fopen($file_name, "r");
  $result = vec[];

  if ($handle) {
    while (($line = fgets($handle)) !== false) {
      $result[] = intval($line);
    }
  }
  
  return $result;
}

function part_one($file_name): int {
  $numbers = read_file($file_name);
  $numbers_set = Set {};
  $result = -1;

  foreach ($numbers as $number) {
    if ($numbers_set->contains(2020 - $number)) {
      $result = $number * (2020 - $number);
      break;
    } else {
      $numbers_set->add($number);
    }    
  }

  return $result;
}

function part_two($file_name): int {
  $numbers = read_file($file_name);
  $numbers_set = new Set($numbers);
  $result = -1;

  foreach($numbers as $k1 => $v1) {
    foreach($numbers as $k2 => $v2) {
      if ($numbers_set->contains(2020 - $v1 - $v2)) {
        $result = $v1 * $v2 * (2020 - $v1 - $v2);
        break;
      }
    }
  }

  return $result;
}

<<__EntryPoint>>
function main(): void {
  echo "part 1 " . part_one("day1.sample") . " " . part_one("day1.input") . \PHP_EOL;
  echo "part 2 " . part_two("day1.sample") . " " . part_two("day1.input") . \PHP_EOL;
}