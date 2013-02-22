//
//  RainData.h
//  Flood_Calcs
//
//  Created by Mick Brown on 14/05/12.
//  Copyright (c) 2012 Entretec Pty Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface RainData : NSManagedObject

@property (nonatomic, retain) NSString * rainfall_area;
@property (nonatomic, retain) NSNumber * rainfall_coeff;
@property (nonatomic, retain) NSNumber * rainfall_hour;
@property (nonatomic, retain) NSNumber * rainfall_index;
@property (nonatomic, retain) NSNumber * rainfall_year;

@end


@interface Soil_Manning : NSManagedObject

@property (nonatomic, retain) NSNumber * manning_coeff;
@property (nonatomic, retain) NSNumber * manning_index;
@property (nonatomic, retain) NSNumber * max_velocity;
@property (nonatomic, retain) NSString * soiltype;

@end

@interface PipeMaterial : NSManagedObject

@property (nonatomic, retain) NSNumber * global_mannings;
@property (nonatomic, retain) NSString * pipematerial;

@end

@interface PipeDb : NSManagedObject

@property (nonatomic, retain) NSNumber * diameter;
@property (nonatomic, retain) NSNumber * diameter_calc;
@property (nonatomic, retain) NSNumber * pipe_area;

@end

@interface GetValue : NSManagedObject

@property (nonatomic, retain) NSNumber * getvalue_choice;
@property (nonatomic, retain) NSNumber * getvalue_index;
@property (nonatomic, retain) NSNumber * getvalue_qe5;
@property (nonatomic, retain) NSNumber * getvalue_years;
@property (nonatomic, retain) NSNumber * id;

@end

@interface EntranceDesign : NSManagedObject

@property (nonatomic, retain) NSNumber * entrancecoeff;
@property (nonatomic, retain) NSString * entrancedesign;

@end