function read_file_ints(string $file_name): vec<int> {
  $handle = fopen($file_name, "r");
  $result = vec[];

  if ($handle) {
    $line = fgets($handle);
    while ($line !== false) {
      $result[] = intval($line);
      $line = fgets($handle);
    }
  }
  
  return $result;
}