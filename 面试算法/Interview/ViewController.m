//
//  ViewController.m
//  Interview
//
//  Created by 曹学亮 on 2018/8/22.
//  Copyright © 2018年 Cao Xueliang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) NSMutableArray *tmpArray;
@end

@implementation ViewController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *tmpStr = @"the sky is blue";
    //NSLog(@"%@",[self p_reversalString:tmpStr]);
   
    
    NSArray *tmp = @[@6,@5,@3,@1,@8,@7,@2,@4,@11,@9,@10];

    //NSLog(@"%@",[self bubbleSort:tmp]);
    //NSLog(@"%@",[self sortValue:tmp]);
    //NSLog(@"%@",[self insertSort:tmp]);
    NSArray *arr = @[@5,@3,@6,@2,@1,@4,@8,@7];
    //NSLog(@"%@",[self chilleSort:tmp]);
    NSMutableArray *mutableArray = [[NSMutableArray alloc]initWithArray:arr];
    [self mergeSortArray:mutableArray];
    NSLog(@"%@",mutableArray);
    
}

#pragma mark - Private menthod

/**
 字符串反转

 给一个字符串，将其按照单词顺序进行反转。比如说 s 是 "the sky is blue",
 那么反转就是 "blue is sky the"。
 
 @param str 正序的字符串
 @return 倒序的字符串
 */
- (NSString *)p_reversalString:(NSString *)str{
    NSMutableString *reversalStr = [[NSMutableString alloc]init];
    NSArray *tmpArray = [str componentsSeparatedByString:@" "];
    NSArray *reveralArray = [[tmpArray reverseObjectEnumerator] allObjects];
    for (int i = 0; i < tmpArray.count; i++) {
        [reversalStr appendString:reveralArray[i]];
        if (i < tmpArray.count - 1) {
            [reversalStr appendString:@" "];
        }
    }
    return reversalStr;
}

#pragma mark - -----------排序-------------

/**
 * 冒泡排序
 * 从左到右不断交换相邻逆序的元素，在一轮的循环之后，可以让未排序的最大元素上浮到右侧。
   在一轮循环中，如果没有发生交换，就说明数组已经是有序的，此时可以直接退出。
 */
- (NSArray *)bubbleSort:(NSArray *)arr{
    NSMutableArray *tmpArray = [[NSMutableArray alloc]initWithArray:arr];
    int arrCount = (int)arr.count;
    
    for (int i = arrCount - 1; i > 0; i--) {
        for (int j = 0; j < i; j++) {
            //比较前后连个元素大小，如果是逆序的就交换两个元素的位置
            NSNumber *numI = tmpArray[j];
            NSNumber *numJ = tmpArray[j+1];
            if ([numI floatValue] > [numJ floatValue]) {
                tmpArray[j] = numJ;
                tmpArray[j + 1] = numI;
            }
        }
    }
    return tmpArray;
}



/**
 * 选择排序
 * 选择出数组中的最小元素，将它与数组的第一个元素交换位置。再从剩下的元素中选择出最小的元素，将它与数组的第二个元素交换位置。不断进行这样的操作，直到将整个数组排序。
 */
- (NSArray *)sortValue:(NSArray *)arr{
    NSMutableArray *tmpArray = [[NSMutableArray alloc]initWithArray:arr];
    NSInteger count = arr.count;
    NSInteger minIndex = 0;
    for (int i = 0; i < count; i++) {
        minIndex = i;
        for (int j = i + 1; j < count; j++) {
            //从剩余数组中找找出最小的元素索引
            if ([tmpArray[minIndex] floatValue] > [tmpArray[j] floatValue]) {
                minIndex = j;
            }
        }
        NSNumber *numI = tmpArray[i];
        NSNumber *numMin = tmpArray[minIndex];
        tmpArray[i] = numMin;
        tmpArray[minIndex] = numI;
    }
    return tmpArray;
}



/**
 插入排序
 它的工作原理是通过构建有序序列，对于未排序数据，在已排序序列中从后向前扫描，找到相应位置并插入。
 插入排序在实现上，通常采用in-place排序（即只需用到 {\displaystyle O(1)} {\displaystyle O(1)}的额外空间的排序），
 因而在从后向前扫描过程中，需要反复把已排序元素逐步向后挪位，为最新元素提供插入空间。
 */
- (NSArray *)insertSort:(NSArray *)arr{
    NSMutableArray *tmpArray = [[NSMutableArray alloc]initWithArray:arr];
    NSInteger count = arr.count;
    for (int i = 1; i < count; i++) {
        for (int j = i; j > 0; j--) {
            NSNumber *currentNum = tmpArray[j];
            NSNumber *compareNum = tmpArray[j - 1];
            if ([currentNum floatValue] < [compareNum floatValue]) {
                tmpArray[j] = compareNum;
                tmpArray[j-1] = currentNum;
            }else{
                break;
            }
        }
    }
    return tmpArray;
}



/**
 希尔排序
 希尔排序，也称递减增量排序算法，是插入排序的一种更高效的改进版本。希尔排序是非稳定排序算法。
 希尔排序通过将比较的全部元素分为几个区域来提升插入排序的性能。这样可以让一个元素可以一次性地朝最终位置前进一大步。然后算法再取越来越小的步长进行排序。
 */
- (NSArray *)chilleSort:(NSArray *)arr{
    NSMutableArray *tmpArray = [[NSMutableArray alloc]initWithArray:arr];
    NSInteger length = arr.count;
    int h = 1;
    
    //计算步长
    while (h < length / 3) {
        h  = 3 * h + 1; //h = 4,7,10,13,16
    }
    
    while (h >= 1) {
        for (int i = h; i < length ; i++) {
            for (int j = i; j >= h && (tmpArray[j] < tmpArray[j - h]); j-=h) {
                NSNumber *numOne = tmpArray[j];
                NSNumber *numTwo = tmpArray[j - h];
                tmpArray[j] = numTwo;
                tmpArray[j-h] = numOne;
            }
        }
        h = h / 3;
    }
    return tmpArray;
}



/**
 归并排序
 归并排序是建立在归并操作上的一种有效的排序算法,该算法是采用分治法
 归并排序的思想是将数组分成两部分，分别进行排序，然后归并起来。
 */

/***--------------自上而下进行排序---------------**/
- (void)mergeSortArray:(NSMutableArray *)array{
    //创建一个辅助数组
    NSMutableArray *auxArray = [[NSMutableArray alloc]initWithCapacity:array.count];
    
    //对数组进行第一次二分
    [self mergeSort:array auxArray:auxArray low:0 high:(int)(array.count - 1)];
}


//对数组进行拆分
- (void)mergeSort:(NSMutableArray *)arr auxArray:(NSMutableArray *)auxArray low:(int)low high:(int)high{
    if (high <= low) {
        return;
    }
    int middel = low + (high - low) / 2;
    [self mergeSort:arr auxArray:auxArray low:low high:middel];
    [self mergeSort:arr auxArray:auxArray low:middel + 1 high:high];
    
    [self merge:arr auxArray:auxArray low:low middel:middel high:high];
}

//将数组中两个已经排序的部分归并成一个
- (void)merge:(NSMutableArray *)array auxArray:(NSMutableArray *)auxArray low:(int)low middel:(int)middle high:(int)high {
    
    int i = low;
    int j = middle + 1;
   
    for (int k = low; k <= high; k++) {
        //将数据复制到辅助数组
        auxArray[k] = array[k];
    }

    for (int k = low; k <= high; k++) {
        if (i > middle) {
            array[k] = auxArray[j++];
        }else if (j > high){
            array[k] = auxArray[i++];
        }else if (auxArray[i] <= array[j]){
            array[k] = auxArray[i++];
        }else{
            array[k] = auxArray[j++];
        }
    }
    
}

/**--------------自下而上进行排序----------------*/
- (void)mergeIteration:(NSMutableArray *)arr{
    int N = (int)arr.count;
    NSMutableArray *auxArray = [[NSMutableArray alloc]initWithCapacity:arr.count];
    for (int sz = 1; sz < N; sz += sz) {
        for (int i = 0; i < N - sz; i += sz + sz) {
            [self merge:arr auxArray:auxArray low:i middel:i + sz - 1 high:MIN(i + sz + sz - 1, N - 1)];
        }
    }
}


@end

