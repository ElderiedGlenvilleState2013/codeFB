import Cocoa

var str = "Hello, playground"

// recursive algorithm

func getFib(_ position: Int) -> Int {
    
    if position == 0 || position == 1 {
        return position
    }
    return getFib(position - 1) + getFib(position - 2)
}

print(getFib(9))

//Binary Search

func binarySearch(_ array: [Int], value: Int) -> Int? {
    var lowIndex = 0
    var highIndex = array.count - 1
    
    while lowIndex <= highIndex {
        let midIndex = (lowIndex + highIndex) / 2
        if array[midIndex] == value {
            return midIndex
        } else if array[midIndex] < value {
            lowIndex = midIndex + 1
        } else {
            highIndex = midIndex - 1
        }
        
    }
    return nil
}

let testArray  = [1,3, 9, 11, 15, 19, 29]

let testValue1 = 25
let testVal2 = 15

//print(binarySearch(testArray, value: testValue1))

print(binarySearch(testArray, value: testVal2)!)



//Linked List

class Node {
    var value: Int
    var next: Node?
    var left: Node?
    var right: Node?
    
    init(value: Int) {
        self.value = value
    }
}

class LinkedList {
    
    var head: Node?
    
    init(head: Node?) {
        self.head = head
    }
    
    func append(_ node: Node) {
        
        guard head != nil else {
            head = node
            return
        }
        
        var current = head
        while let _ = current?.next {
            current = current?.next
        }
        current?.next = node
    }
    
    // Get a node from a particular position.
    /*
    func getNode(atPosition: Node) {
        
        
        
       
        }
 
 */
        // Assume the first position is "1".
        // Return "nil" if position is not in the list.
        func getNode(atPosition position: Int) -> Node? {
            guard position > 0 else {
                return nil
            }
            
            var counter = 1
            var current = head
            
            while current != nil && counter <= position {
                if counter == position {
                    return current
                }
                current = current?.next
                counter += 1
            }
            return nil
        }
        
        // Insert a new node at the given position.
        // Assume the first position is "1".
        // Inserting at position 3 means between
        // the 2nd and 3rd nodes.
        func insertNode(_ node: Node, at position: Int) {
            guard position > 0 else {
                return
            }
            
            var counter = 1
            var current = head
            
            if position > 1 {
                while current != nil && counter < position {
                    if counter == position - 1 {
                        node.next = current?.next
                        current?.next = node
                        break
                    }
                    current = current?.next
                    counter += 1
                }
            } else if position == 1 {
                node.next = head
                head = node
            }
            
        }
        
        // Delete the first node with a given value.
        func deleteNode(withValue value: Int) {
            var current = head
            var previous: Node?
            
            while current?.value != value && current?.next != nil {
                previous = current
                current = current?.next
            }
            
            if current?.value == value {
                if previous != nil {
                    previous?.next = current?.next
                } else {
                    head = current?.next
                }
            }
            
        }
    }
    
    // Test cases
    
    // Set up some Nodes
    let n1 = Node(value: 1)
    let n2 = Node(value: 2)
    let n3 = Node(value: 3)
    let n4 = Node(value: 4)
    
    // Start setting up a LinkedList
    let ll = LinkedList(head: n1)
    ll.append(n2)
    ll.append(n3)
    
    // Test getNode(atPosition:)
    print(ll.head!.next!.next!.value) // Should print 3
    print(ll.getNode(atPosition: 3)!.value) // Should also print 3
    
    // Test insert
    ll.insertNode(n4, at: 3)
    print(ll.getNode(atPosition: 3)!.value) // Should print 4 now
    
    // Test delete(withValue:)
    ll.deleteNode(withValue: 1)
    print(ll.getNode(atPosition: 1)!.value) // Should print 2 now
    print(ll.getNode(atPosition: 2)!.value) // Should print 4 now
    print(ll.getNode(atPosition: 3)!.value) // Should print 3

//Stack

class Stack {
    
    var ll: LinkedList
    
    init(top: Node?) {
        self.ll = LinkedList(head: top)
    }
    
    // add a node to the top of the stack
    func push(_ node: Node) {
        ll.insertNode(node, at: 1)
        
        
    }
    
    func pop() -> Node? {
        let deleteNode = ll.getNode(atPosition: 1)
        if let value = deleteNode?.value {
            ll.deleteNode(withValue: 1)
            
           
        }
        return deleteNode
    }
    
}

// remove and return the topmost node from the stack


 




// Start setting up a Stack
let stack = Stack(top: n1)

// Test stack functionality
//
 stack.push(n2)
 stack.push(n3)
 print(stack.pop()!.value) // Should be 3
 print(stack.pop()!.value) // Should be 2
 print(stack.pop()!.value) // Should be 1
 print(stack.pop()?.value) // Should be nil
 stack.push(n4)
 print(stack.pop()!.value) // Should be 4
 //


//Queues
class Queue {
    var storageArray: [Int]
    
    init(head: Int) {
        storageArray = [head]
    }
//Enqueue (adding elements to array)
    func enqueue(_ element: Int) {
    
        storageArray.append(element)
    }

//Peek fifo
    func peek() -> Int? {
    
    
        return storageArray[0]
    }

    func dequeue() -> Int? {
        return storageArray.remove(at: 0)
    }


}

let q = Queue(head: 1)
q.enqueue(2)
q.enqueue(3)

print(q.peek()!)
print(q.dequeue()!)


//quick sort using recursion

func quicksort(_ input: [Int], low: Int, high: Int) -> [Int] {
    var result = input
    
    if low < high {
        let pivot = result[high]
        var i = low
        
        for j in low..<high {
            if result[j] <= pivot {
                (result[i], result[j]) = (result[j], result[i])
                i += 1
            }
        }
        (result[i], result[high]) = (result[high], result[i])
        result = quicksort(result, low: low, high: i - 1)
        result = quicksort(result, low: i + 1, high: high)
    }
    
    return result
}


//Dictioray  and mapping (set) linear time search

var location = ["North America": ["USA": ["Mountainview"]]]

location["North America"]? ["USA"]?.append("Altanta")
location["Asia"] = ["India": ["Banglore"]]
location["Asia"]?["China"]?.append("Shanghai")
location["Africa"] = ["Egyp": ["Cario"]]

let locationSort = location["North America"]?["USA"]?.sorted()

for city in locationSort! {
    print(city)
}

var asiaCities = [String]()

for (country, city) in location["Asia"]! {
    let cityCountry = "\(country) - \(city)"
    asiaCities.append(cityCountry)
    for city in asiaCities.sorted() {
        print(city)
    }
    
    
}

//hash mapping constant time search
class HashTable {
    

    
    var table: [[String]]
    
    init() {
        table = Array(repeating: [], count: 10000)
    }
    
    func calculateHashValue(_ input: String) -> Int {
        return getFirstCharacterValue(input) * 100 + getSecondCharacterValue(input)
    
    }
    
    func store(_ input: String) {
        let hashValue = calculateHashValue(input)
        table[hashValue].append(input)
        
    }
    
    
    
    func lookup(_ input: String) -> Bool {
        let hashValue = calculateHashValue(input)
        
        return table[hashValue].contains(input)
        
        
        
    }

    
    


    func getFirstCharacterValue(_ input: String) -> Int {
        if input.count > 0 {
            return Int(input[input.startIndex].unicodeScalars.first!.value)
        
        
    }
            return 0
}

    func getSecondCharacterValue(_ input: String) -> Int {
        if input.count > 1 {
            return Int(input[input.startIndex].unicodeScalars.first!.value)
        
    }
            return 0
}
    
    
    
    
}
//its look up is linear
let hashTable = HashTable()

let string1 = "Udacity"
let string2 = "UDACIOUS"
let string3 = "SWIFTASTIC"

hashTable.store(string1)
hashTable.store(string2)
hashTable.store(string3)

print(hashTable.lookup("Swift"))
print(hashTable.lookup("UDACIOUS"))
print(hashTable.lookup("UDICAIN"))
print(hashTable.lookup("SWIFTASTIC"))



//Trees
class BinaryTree {
    var root: Node
    
    init(rootvalue: Int) {
        self.root = Node(value: rootvalue)
    }
    
    func search(_ value: Int) -> Bool {
        
        
        
        return preorderSearch(root, value: value)
    }
    
    func printTree() -> String {
        
        let result = preorderPrint(root, traverse: "")!
        
        
        return String(result[..<result.index(before: result.endIndex)])
    }
    
    func preorderSearch(_ start: Node?, value: Int) -> Bool {
        
        if let start = start {
            if start.value == value {
                return true
            } else {
                return preorderSearch(start.left, value: value) || preorderSearch(start.right, value: value)
            }
            
        }
        
        
        return false
    }
    
    func preorderPrint(_ start: Node?, traverse: String) -> String? {
        
        var result = traverse
        if let start = start {
            result += "\(start.value)-"
            
            if let newValue = preorderPrint(start.left, traverse: result) {
                result = newValue
            }
            if let newValue = preorderPrint(start.right, traverse: result) {
                result = newValue
            }
            
        }
        
        
        return result
    }
}


// Test cases
// Set up tree
let tree = BinaryTree(rootvalue: 1)
tree.root.left = Node(value: 2)
tree.root.right = Node(value: 3)
tree.root.left?.left = Node(value: 4)
tree.root.left?.right = Node(value: 5)

// Test search
print(tree.search(4)) // Should be true
print(tree.search(6)) // Should be false

// Test printTree
print(tree.printTree()) // Should be 1-2-4-5-3

//BST search best search tree

class BST {
    
    var root: Node
    
    init(value: Int) {
        self.root = Node(value: value)
    }
    
    func search(_ value: Int) -> Bool {
        return searchHelper(root, value: value)
    }
    
    // create a node with the given value and insert it into the binary tree
    func insert(_ value: Int) {
        insertHelper(root, value: value)
        
    }
    
    // helper method - use to implement a recursive search function
    func searchHelper(_ current: Node?, value: Int) -> Bool {
        
        if let current = current {
            if value == current.value {
                return true
            } else if value < current.value {
                return searchHelper(current.left, value: value)
            } else {
                return searchHelper(current.right, value: value)
            }
        }
        return false
        
        
        
    }
    
    // helper method - use to implement a recursive insert function
    func insertHelper(_ current: Node, value: Int) {
        if current.value < value {
            if let right = current.right {
                insertHelper(right, value: value)
            } else {
                current.right = Node(value: value)
            }
        } else {
            if let left = current.left {
                insertHelper(left, value: value)
            } else {
                current.left = Node(value: value)
            }
        }

    }
}

// Test cases
// Set up tree
let trees = BST(value: 4)

// Insert elements
trees.insert(2)
trees.insert(1)
trees.insert(3)
trees.insert(5)

// Check search
print(trees.search(4)) // Should be true
print(trees.search(6)) // Should be false
