use namespace HH\Lib\{Str};

abstract class DayBase {
  protected vec<string> $lines = vec[];

  public function load_file(string $file_name): void {
    $lines = vec[];
    $handle = \fopen($file_name, "r");

    if ($handle) {
      $line = \fgets($handle);
      while ($line  !== false) {
        $this->lines[] = Str\trim($line);
        $line = \fgets($handle);
      }
    }
  }
}