#!/usr/bin/env hhvm

<<__EntryPoint>>
async function main(): Awaitable<void> {
  require_once(__DIR__.'/../vendor/autoload.hack');
  \Facebook\AutoloadMap\initialize();

  $day = (int) (vec(\HH\global_get('argv') as Container<_>)[1] ?? 1);

  switch ($day) {
    case 1:
      echo "1.1 " . day1_part_one("day1.sample") . " " . day1_part_one("day1.input") . \PHP_EOL;
      echo "1.2 " . day1_part_two("day1.sample") . " " . day1_part_two("day1.input") . \PHP_EOL;
      break;
    case 2:
      echo "2.1 " . day2_part_one("day2.sample") . " " . day2_part_one("day2.input") . \PHP_EOL;
      echo "2.2 " . day2_part_two("day2.sample") . " " . day2_part_two("day2.input") . \PHP_EOL;
      break;
  }
}
