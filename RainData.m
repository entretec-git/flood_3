//
//  RainData.m
//  Flood_Calcs
//
//  Created by Mick Brown on 14/05/12.
//  Copyright (c) 2012 Entretec Pty Ltd. All rights reserved.

//  @dynamic is handled by the database

#import "RainData.h"


@implementation RainData

@dynamic rainfall_area;
@dynamic rainfall_coeff;
@dynamic rainfall_hour;
@dynamic rainfall_index;
@dynamic rainfall_year;

@end

@implementation Soil_Manning

@dynamic manning_coeff;
@dynamic manning_index;
@dynamic max_velocity;
@dynamic soiltype;

@end

@implementation PipeMaterial

@dynamic global_mannings;
@dynamic pipematerial;

@end


@implementation PipeDb

@dynamic diameter;
@dynamic diameter_calc;
@dynamic pipe_area;

@end

@implementation GetValue

@dynamic getvalue_choice;
@dynamic getvalue_index;
@dynamic getvalue_qe5;
@dynamic getvalue_years;
@dynamic id;

@end


@implementation EntranceDesign

@dynamic entrancecoeff;
@dynamic entrancedesign;

@end
