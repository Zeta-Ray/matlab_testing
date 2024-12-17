% tests/test_sum_two_values.m
function tests = test_sum_two_values
    tests = functiontests(localfunctions);
end

function testSum(testCase)
    actSolution = sum_two_values(3, 4);
    expSolution = 7;
    verifyEqual(testCase, actSolution, expSolution);
end
