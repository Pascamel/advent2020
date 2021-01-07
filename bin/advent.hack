#!/usr/bin/env hhvm

<<__EntryPoint>>
async function main(): Awaitable<void> {
  require_once(__DIR__.'/../vendor/autoload.hack');
  \Facebook\AutoloadMap\initialize();

  $day = (int) (vec(\HH\global_get('argv') as Container<_>)[1] ?? 1);

  switch ($day) {
    case 1:
      echo Day1::solve("data/day1.sample", "data/day1.input");
      break;
    case 2:
      echo Day2::solve("data/day2.sample", "data/day2.input");
      break;
    case 3:
      echo Day3::solve("data/day3.sample", "data/day3.input");
      break;
    case 4:
      echo Day4::solve("data/day4.sample", "data/day4.input");
      break;
  }
}
