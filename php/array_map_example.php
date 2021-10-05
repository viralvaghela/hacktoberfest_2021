
<?php
function show_Indonesian(int $n, string $m): string
{
    return "The number {$n} is called {$m} in Indonesian";
}

function map_Indonesian(int $n, string $m): array
{
    return [$n => $m];
}

$a = [1, 2, 3, 4, 5];
$b = ['satu', 'dua', 'tiga', 'empat', 'lima'];

$c = array_map('show_Indonesian', $a, $b);
print_r($c);

$d = array_map('map_Indonesian', $a , $b);
print_r($d);
?>
