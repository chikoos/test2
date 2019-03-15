const sayHello = require('../../lib/index.js');

test('sayHello test', () => {
   expect(sayHello()).toMatch('hi, how are you');
});
