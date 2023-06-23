<?php
class Node {
    public $interval;
    public $max_end;
    public $left;
    public $right;

    public function __construct($interval) {
        $this->interval = $interval;
        $this->max_end = $interval[1];
        $this->left = null;
        $this->right = null;
    }
}

class IntervalSearchTree {
    public $root;

    public function __construct() {
        $this->root = null;
    }

    public function insert($interval) {
        if (!$this->root) {
            $this->root = new Node($interval);
        } else {
            $this->_insert_helper($this->root, $interval);
        }
    }

    private function _insert_helper($node, $interval) {
        if ($interval[0] < $node->interval[0]) {
            if ($node->left) {
                $this->_insert_helper($node->left, $interval);
            } else {
                $node->left = new Node($interval);
            }
        } else {
            if ($node->right) {
                $this->_insert_helper($node->right, $interval);
            } else {
                $node->right = new Node($interval);
            }
        }
        $node->max_end = max($node->max_end, $interval[1]);
    }

    public function overlaps($interval) {
        return $this->_overlaps_helper($this->root, $interval);
    }

    private function _overlaps_helper($node, $interval) {
        if (!$node) {
            return false;
        }
        if ($node->interval[1] > $interval[0] && $node->interval[0] < $interval[1]) {
            return true;
        }
        if ($node->left && $node->left->max_end > $interval[0]) {
            return $this->_overlaps_helper($node->left, $interval);
        }

        return $this->_overlaps_helper($node->right, $interval);
    }
}


// // Example usage:
// $tree = new IntervalSearchTree();

// // Insert intervals into the tree
// $tree->insert([7, 8]);
// $tree->insert([9, 10]);
// $tree->insert([13, 14]);

// // Test if two intervals overlap
// var_dump($tree->overlaps([6, 8])); // true
// var_dump($tree->overlaps([7, 9])); // true
// var_dump($tree->overlaps([9, 10])); // true
// var_dump($tree->overlaps([8, 9])); // false
