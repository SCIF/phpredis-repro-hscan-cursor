<?php

declare(strict_types=1);

$redis = new Redis();

if (!$redis->connect('redis')) {
    throw new \Exception('Could not connect to server');
}

$redis->hSet('ab', 'foo', 'bar');
$redis->hSet('ab', 'foo2', 123);

function testHscan($cursor, $redis) {
    echo "Cursor: ";
    var_export($cursor);
    echo "\nResult: " . var_export($redis->hscan('ab', $cursor), true) . "\n==========\n";
}

testHscan(0, $redis);
testHscan(0.0, $redis);
testHscan('0', $redis);
testHscan(null, $redis);
testHscan(11, $redis);
