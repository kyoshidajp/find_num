# find_num

Find the number which picked up at random from array.

## Description

An array has random numbers from 1 to 1000. When an arbitrary number was picked up from the array, the program find the number.
 
For example, when an original random array is the following.

```
[1, 5, 3, 2, 4]
```

And if picked up number is 3, then the array is the following.

```
[1, 5, 2, 4]
```

The program could find 3 from this array.

## Requirement

- Ruby(MRI) 2.2.4 or higher

## Usage

### Setup

Run `bundle install`. Like this.

```
bundle install --path vendor/bundle
```

## Run

```
bundle exec ruby num_finder.rb
```

An output example:

```
numbers: [970, 870, 657, 612, 810, ... ]
picked_up_number: 94
found_number: 94
```

`numbers` is an random array which is picked up an arbitrary number.
  
`picked_up_number` is picked up number from the array.

`found_number` is found number.

### Run RSpec

```
bundle exec rspec num_finder_spec.rb
```

## Discussion

See [Discussion](https://github.com/kyoshidajp/find_num/wiki/Discussion)

## Author

[kyoshidajp](https://github.com/kyoshidajp)