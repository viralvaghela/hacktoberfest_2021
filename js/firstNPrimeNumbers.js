/**
 * 
 * @param {number} number a positive, finite number
 * @returns a boolean indicating if the number is prime or not
 */
const isNumberPrime = (number) => {
    if (number <= 1 || !isFinite(number)) return false;

    for (let i = 2; i <= number / 2; i += 1) {
        if (number % i === 0) return false;
    }

    return true;
};

console.log(isNumberPrime(1));
console.log(isNumberPrime('671'));

/**
 * 
 * @param {number} n number of prime numbers, must be a finite, positive number
 * @returns an array of prime numbers
 */
const firstNPrimeNumbers = (n) => {
    const primeNumbers = [];

    for (let i = 2; ; i++) {
        if (primeNumbers.length == n) break;

        // appends prime numbers to the array
        isNumberPrime(i) && primeNumbers.push(i);
    }

    return primeNumbers;
};

console.log(firstNPrimeNumbers(22));
console.log(firstNPrimeNumbers('10'));
